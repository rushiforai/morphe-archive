"""Helpers for reading the exact decoded libvrlink_scene.so bases (static analysis only)."""
import hashlib
import io
import os
import struct

from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM
from elftools.elf.elffile import ELFFile
from elftools.elf.relocation import RelocationSection

ROOT = os.environ.get('GXR_DECODED_ROOT') or os.path.normpath(os.path.join(
    os.path.dirname(os.path.abspath(__file__)), '..', '..', '..', '..', 'builds', 'steamlink-patches', 'build',
    'adapt-5002527-render', 'tree', 'steamlink-patches'))

BASES = {
    5001712: '2.0.20-5001712', 5001812: '2.0.20-5001812', 5001968: '2.0.21-5001968',
    5002244: '2.0.22-5002244', 5002363: '2.0.23-5002363', 5002395: '2.0.24-5002395', 5002527: '2.0.24-5002527',
}


def lib_path(code):
    return os.path.join(ROOT, 'android-steamlinkvr-release-base-%s' % BASES[code], 'lib', 'arm64-v8a',
                        'libvrlink_scene.so')


class Scene:
    def __init__(self, code):
        self.code = code
        self.path = lib_path(code)
        with open(self.path, 'rb') as source:
            self.data = source.read()
        self.sha = hashlib.sha256(self.data).hexdigest().upper()
        self.elf = ELFFile(io.BytesIO(self.data))
        self.cs = Cs(CS_ARCH_ARM64, CS_MODE_ARM)
        self.cs.detail = True
        self.syms = {}
        self.sizes = {}
        dynsym = self.elf.get_section_by_name('.dynsym')
        for s in dynsym.iter_symbols():
            if s['st_shndx'] != 'SHN_UNDEF' and s.name:
                self.syms[s.name] = s['st_value']
                self.sizes[s.name] = s['st_size']
        self.plt_names = {}
        for sec in self.elf.iter_sections():
            if isinstance(sec, RelocationSection) and sec.name == '.rela.plt':
                for r in sec.iter_relocations():
                    self.plt_names[r['r_offset']] = dynsym.get_symbol(r['r_info_sym']).name
        # first PT_LOAD maps file offset == vaddr
        self.load = [s for s in self.elf.iter_segments() if s['p_type'] == 'PT_LOAD']
        self.text_load = [s for s in self.load if s['p_flags'] & 1][0]
        assert self.text_load['p_offset'] == self.text_load['p_vaddr'], 'text virtual/file offsets differ'
        self._plt = None

    def va2off(self, va):
        for s in self.load:
            if s['p_vaddr'] <= va < s['p_vaddr'] + s['p_filesz']:
                return va - s['p_vaddr'] + s['p_offset']
        raise KeyError(hex(va))

    def read(self, va, n):
        o = self.va2off(va)
        return self.data[o:o + n]

    def word(self, va):
        return struct.unpack('<I', self.read(va, 4))[0]

    def sym(self, needle, exact=False):
        hits = [(n, v) for n, v in self.syms.items() if (n == needle if exact else needle in n)]
        return hits

    def plt_stub_name(self, va):
        """Resolve a PLT stub address to the imported symbol name (adrp/ldr/add/br pattern)."""
        if self._plt is None:
            self._plt = {}
            sec = self.elf.get_section_by_name('.plt')
            base = sec['sh_addr']
            code = self.read(base, sec['sh_size'])
            for ins in self.cs.disasm(code, base):
                pass
            insns = list(self.cs.disasm(code, base))
            for i in range(len(insns) - 3):
                a, b, c, d = insns[i:i + 4]
                if a.mnemonic == 'adrp' and b.mnemonic == 'ldr' and c.mnemonic == 'add' and d.mnemonic == 'br':
                    got = a.operands[1].imm + b.operands[1].mem.disp
                    self._plt[a.address] = self.plt_names.get(got)
        return self._plt.get(va)

    def dis(self, va, size):
        return list(self.cs.disasm(self.read(va, size), va))

    def func(self, name):
        va = self.syms[name]
        return va, self.sizes[name]

    def find_one(self, needle):
        hits = self.sym(needle)
        assert len(hits) == 1, (needle, hits)
        return hits[0]
