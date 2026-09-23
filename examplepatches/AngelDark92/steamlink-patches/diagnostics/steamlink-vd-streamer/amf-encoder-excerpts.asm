; Read-only static extraction 2026-09-22
; Input: C:\Program Files\Virtual Desktop Streamer\libVirtualDesktopAMF.dll
; SHA256: 6b9db41dc1d1df78d8dca9e89fa1104fe400a05a2b1885b36fbfae4ae1966396
; Addresses are PE RVAs (image base 0x180000000). Only selected ranges retained.

; Codec6/11 branch and default output | bytes SHA256 3ad7128466f6f27101bfa18f984d3bbce34e740f81bce6df900782ba1e5c207f
00001d47  49 8b 07                       mov      rax, qword ptr [r15]
00001d4a  4d 8d 4c 24 08                 lea      r9, [r12 + 8]
00001d4f  4c 8d 05 62 83 02 00           lea      r8, [rip + 0x28362] ; AMFVideoConverter
00001d56  49 8b 14 24                    mov      rdx, qword ptr [r12]
00001d5a  49 8b cf                       mov      rcx, r15
00001d5d  ff 50 08                       call     qword ptr [rax + 8]
00001d60  85 c0                          test     eax, eax
00001d62  0f 85 4b 0d 00 00              jne      0x180002ab3
00001d68  8b 4d 48                       mov      ecx, dword ptr [rbp + 0x48]
00001d6b  8d 41 f6                       lea      eax, [rcx - 0xa]
00001d6e  83 f8 01                       cmp      eax, 1
00001d71  41 0f 96 c0                    setbe    r8b
00001d75  8d 41 fe                       lea      eax, [rcx - 2]
00001d78  41 bd 01 00 00 00              mov      r13d, 1
00001d7e  a9 fb ff ff ff                 test     eax, 0xfffffffb
00001d83  74 04                          je       0x180001d89
00001d85  32 c0                          xor      al, al
00001d87  eb 0d                          jmp      0x180001d96
00001d89  41 0f b6 c5                    movzx    eax, r13b
00001d8d  83 f9 06                       cmp      ecx, 6
00001d90  0f 84 00 04 00 00              je       0x180002196
00001d96  83 f9 0b                       cmp      ecx, 0xb
00001d99  0f 84 f7 03 00 00              je       0x180002196
00001d9f  c6 45 70 00                    mov      byte ptr [rbp + 0x70], 0
00001da3  44 89 6d 40                    mov      dword ptr [rbp + 0x40], r13d
00001da7  4c 89 6d b0                    mov      qword ptr [rbp - 0x50], r13

; HEVC color properties and ten-bit path | bytes SHA256 410580eae3c8b8648d64bf2e6dc098b3edec9b4fd0b74e2b9c4ad582df5a5db3
00001f96  90                             nop      
00001f97  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00001f9c  44 89 6d c0                    mov      dword ptr [rbp - 0x40], r13d
00001fa0  44 0f b6 7d 60                 movzx    r15d, byte ptr [rbp + 0x60]
00001fa5  44 88 7d c8                    mov      byte ptr [rbp - 0x38], r15b
00001fa9  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00001fad  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00001fb1  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00001fb6  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00001fbb  48 8b 01                       mov      rax, qword ptr [rcx]
00001fbe  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00001fc2  48 8d 15 7f 82 02 00           lea      rdx, [rip + 0x2827f] ; HevcNominalRange
00001fc9  ff 50 18                       call     qword ptr [rax + 0x18]
00001fcc  90                             nop      
00001fcd  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00001fd2  44 89 6d c0                    mov      dword ptr [rbp - 0x40], r13d
00001fd6  0f b6 45 68                    movzx    eax, byte ptr [rbp + 0x68]
00001fda  88 45 c8                       mov      byte ptr [rbp - 0x38], al
00001fdd  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00001fe1  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00001fe5  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00001fea  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00001fef  48 8b 01                       mov      rax, qword ptr [rcx]
00001ff2  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00001ff6  48 8d 15 73 82 02 00           lea      rdx, [rip + 0x28273] ; HevcEnableVBAQ
00001ffd  ff 50 18                       call     qword ptr [rax + 0x18]
00002000  90                             nop      
00002001  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00002006  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
0000200d  4c 89 6d c8                    mov      qword ptr [rbp - 0x38], r13
00002011  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002015  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002019  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
0000201e  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002023  48 8b 01                       mov      rax, qword ptr [rcx]
00002026  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
0000202a  48 8d 15 5f 82 02 00           lea      rdx, [rip + 0x2825f] ; HevcInColorPrimaries
00002031  ff 50 18                       call     qword ptr [rax + 0x18]
00002034  90                             nop      
00002035  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
0000203a  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002041  49 8b fd                       mov      rdi, r13
00002044  b8 07 00 00 00                 mov      eax, 7
00002049  45 84 ff                       test     r15b, r15b
0000204c  48 0f 45 f8                    cmovne   rdi, rax
00002050  48 89 7d c8                    mov      qword ptr [rbp - 0x38], rdi
00002054  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002058  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
0000205c  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002061  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002066  48 8b 01                       mov      rax, qword ptr [rcx]
00002069  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
0000206d  48 8d 15 4c 82 02 00           lea      rdx, [rip + 0x2824c] ; HevcInColorProfile
00002074  ff 50 18                       call     qword ptr [rax + 0x18]
00002077  90                             nop      
00002078  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
0000207d  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002084  48 8b 45 b0                    mov      rax, qword ptr [rbp - 0x50]
00002088  48 89 45 c8                    mov      qword ptr [rbp - 0x38], rax
0000208c  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002090  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002094  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002099  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
0000209e  48 8b 01                       mov      rax, qword ptr [rcx]
000020a1  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000020a5  48 8d 15 3c 82 02 00           lea      rdx, [rip + 0x2823c] ; HevcInColorTransferChar
000020ac  ff 50 18                       call     qword ptr [rax + 0x18]
000020af  90                             nop      
000020b0  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
000020b5  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
000020bc  4c 89 6d c8                    mov      qword ptr [rbp - 0x38], r13
000020c0  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
000020c4  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000020c8  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000020cd  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000020d2  48 8b 01                       mov      rax, qword ptr [rcx]
000020d5  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000020d9  48 8d 15 38 82 02 00           lea      rdx, [rip + 0x28238] ; HevcOutColorPrimaries
000020e0  ff 50 18                       call     qword ptr [rax + 0x18]
000020e3  90                             nop      
000020e4  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
000020e9  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
000020f0  48 89 7d c8                    mov      qword ptr [rbp - 0x38], rdi
000020f4  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
000020f8  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000020fc  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002101  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002106  48 8b 01                       mov      rax, qword ptr [rcx]
00002109  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
0000210d  48 8d 15 34 82 02 00           lea      rdx, [rip + 0x28234] ; HevcOutColorProfile
00002114  ff 50 18                       call     qword ptr [rax + 0x18]
00002117  90                             nop      
00002118  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
0000211d  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002124  4c 89 6d c8                    mov      qword ptr [rbp - 0x38], r13
00002128  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
0000212c  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002130  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002135  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
0000213a  48 8b 01                       mov      rax, qword ptr [rcx]
0000213d  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002141  48 8d 15 28 82 02 00           lea      rdx, [rip + 0x28228] ; HevcOutColorTransferChar
00002148  ff 50 18                       call     qword ptr [rax + 0x18]
0000214b  90                             nop      
0000214c  0f b6 7d 70                    movzx    edi, byte ptr [rbp + 0x70]
00002150  40 84 ff                       test     dil, dil
00002153  0f 84 2a 08 00 00              je       0x180002983
00002159  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
0000215e  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002165  48 c7 45 c8 0a 00 00 00        mov      qword ptr [rbp - 0x38], 0xa
0000216d  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002171  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002175  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
0000217a  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
0000217f  48 8b 01                       mov      rax, qword ptr [rcx]
00002182  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002186  48 8d 15 1b 82 02 00           lea      rdx, [rip + 0x2821b] ; HevcColorBitDepth
0000218d  ff 50 18                       call     qword ptr [rax + 0x18]
00002190  90                             nop      
00002191  e9 ed 07 00 00                 jmp      0x180002983
00002196  41 0f b6 d5                    movzx    edx, r13b
0000219a  88 55 70                       mov      byte ptr [rbp + 0x70], dl
0000219d  b9 0d 00 00 00                 mov      ecx, 0xd
000021a2  89 4d 40                       mov      dword ptr [rbp + 0x40], ecx
000021a5  41 80 7c 24 44 00              cmp      byte ptr [r12 + 0x44], 0
000021ab  0f 84 f6 fb ff ff              je       0x180001da7
000021b1  48 c7 45 b0 0e 00 00 00        mov      qword ptr [rbp - 0x50], 0xe
000021b9  88 55 70                       mov      byte ptr [rbp + 0x70], dl
000021bc  89 4d 40                       mov      dword ptr [rbp + 0x40], ecx
000021bf  e9 e7 fb ff ff                 jmp      0x180001dab

; AV1 color properties and ten-bit path | bytes SHA256 cf61a843f121e733ad6e5ea22263d0a260a6baf864c3af8439a42a062053d1dd
00002389  90                             nop      
0000238a  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
0000238f  44 89 6d c0                    mov      dword ptr [rbp - 0x40], r13d
00002393  44 0f b6 7d 60                 movzx    r15d, byte ptr [rbp + 0x60]
00002398  44 88 7d c8                    mov      byte ptr [rbp - 0x38], r15b
0000239c  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
000023a0  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000023a4  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000023a9  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000023ae  48 8b 01                       mov      rax, qword ptr [rcx]
000023b1  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000023b5  48 8d 15 3c 81 02 00           lea      rdx, [rip + 0x2813c] ; Av1NominalRange
000023bc  ff 50 18                       call     qword ptr [rax + 0x18]
000023bf  90                             nop      
000023c0  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
000023c5  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
000023cc  0f b6 45 68                    movzx    eax, byte ptr [rbp + 0x68]
000023d0  48 89 45 c8                    mov      qword ptr [rbp - 0x38], rax
000023d4  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
000023d8  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000023dc  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000023e1  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000023e6  48 8b 01                       mov      rax, qword ptr [rcx]
000023e9  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000023ed  48 8d 15 24 81 02 00           lea      rdx, [rip + 0x28124] ; Av1AQMode
000023f4  ff 50 18                       call     qword ptr [rax + 0x18]
000023f7  90                             nop      
000023f8  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
000023fd  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002404  4c 89 6d c8                    mov      qword ptr [rbp - 0x38], r13
00002408  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
0000240c  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002410  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002415  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
0000241a  48 8b 01                       mov      rax, qword ptr [rcx]
0000241d  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002421  48 8d 15 08 81 02 00           lea      rdx, [rip + 0x28108] ; Av1InputColorPrimaries
00002428  ff 50 18                       call     qword ptr [rax + 0x18]
0000242b  90                             nop      
0000242c  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00002431  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002438  49 8b fd                       mov      rdi, r13
0000243b  b8 07 00 00 00                 mov      eax, 7
00002440  45 84 ff                       test     r15b, r15b
00002443  48 0f 45 f8                    cmovne   rdi, rax
00002447  48 89 7d c8                    mov      qword ptr [rbp - 0x38], rdi
0000244b  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
0000244f  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002453  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002458  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
0000245d  48 8b 01                       mov      rax, qword ptr [rcx]
00002460  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002464  48 8d 15 f5 80 02 00           lea      rdx, [rip + 0x280f5] ; Av1InputColorProfile
0000246b  ff 50 18                       call     qword ptr [rax + 0x18]
0000246e  90                             nop      
0000246f  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00002474  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
0000247b  48 8b 45 b0                    mov      rax, qword ptr [rbp - 0x50]
0000247f  48 89 45 c8                    mov      qword ptr [rbp - 0x38], rax
00002483  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002487  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
0000248b  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002490  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002495  48 8b 01                       mov      rax, qword ptr [rcx]
00002498  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
0000249c  48 8d 15 ed 80 02 00           lea      rdx, [rip + 0x280ed] ; Av1InputColorTransferChar
000024a3  ff 50 18                       call     qword ptr [rax + 0x18]
000024a6  90                             nop      
000024a7  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
000024ac  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
000024b3  4c 89 6d c8                    mov      qword ptr [rbp - 0x38], r13
000024b7  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
000024bb  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000024bf  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000024c4  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000024c9  48 8b 01                       mov      rax, qword ptr [rcx]
000024cc  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000024d0  48 8d 15 f1 80 02 00           lea      rdx, [rip + 0x280f1] ; Av1OutputColorPrimaries
000024d7  ff 50 18                       call     qword ptr [rax + 0x18]
000024da  90                             nop      
000024db  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
000024e0  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
000024e7  48 89 7d c8                    mov      qword ptr [rbp - 0x38], rdi
000024eb  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
000024ef  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000024f3  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000024f8  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000024fd  48 8b 01                       mov      rax, qword ptr [rcx]
00002500  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002504  48 8d 15 ed 80 02 00           lea      rdx, [rip + 0x280ed] ; Av1OutputColorProfile
0000250b  ff 50 18                       call     qword ptr [rax + 0x18]
0000250e  90                             nop      
0000250f  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00002514  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
0000251b  4c 89 6d c8                    mov      qword ptr [rbp - 0x38], r13
0000251f  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002523  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002527  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
0000252c  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002531  48 8b 01                       mov      rax, qword ptr [rcx]
00002534  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002538  48 8d 15 e9 80 02 00           lea      rdx, [rip + 0x280e9] ; Av1OutputColorTransferChar
0000253f  ff 50 18                       call     qword ptr [rax + 0x18]
00002542  90                             nop      
00002543  0f b6 7d 70                    movzx    edi, byte ptr [rbp + 0x70]
00002547  40 84 ff                       test     dil, dil
0000254a  74 38                          je       0x180002584
0000254c  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00002551  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002558  48 c7 45 c8 0a 00 00 00        mov      qword ptr [rbp - 0x38], 0xa
00002560  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002564  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002568  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
0000256d  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002572  48 8b 01                       mov      rax, qword ptr [rcx]
00002575  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002579  48 8d 15 e0 80 02 00           lea      rdx, [rip + 0x280e0] ; Av1ColorBitDepth
00002580  ff 50 18                       call     qword ptr [rax + 0x18]
00002583  90                             nop      
00002584  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00002589  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002590  48 c7 45 c8 03 00 00 00        mov      qword ptr [rbp - 0x38], 3
00002598  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
0000259c  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000025a0  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000025a5  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000025aa  48 8b 01                       mov      rax, qword ptr [rcx]
000025ad  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000025b1  48 8d 15 d0 80 02 00           lea      rdx, [rip + 0x280d0] ; Av1AlignmentMode
000025b8  ff 50 18                       call     qword ptr [rax + 0x18]
000025bb  90                             nop      

; Converter properties and component init | bytes SHA256 01aa0797f15ef884631a8e8ca6bf6fec257ac311d6d005c5b7b12e2ba377615d
00002983  49 8b 4c 24 08                 mov      rcx, qword ptr [r12 + 8]
00002988  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
0000298f  48 c7 45 c8 03 00 00 00        mov      qword ptr [rbp - 0x38], 3
00002997  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
0000299b  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
0000299f  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000029a4  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000029a9  48 8b 01                       mov      rax, qword ptr [rcx]
000029ac  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000029b0  48 8d 15 41 7f 02 00           lea      rdx, [rip + 0x27f41] ; MemoryType
000029b7  ff 50 18                       call     qword ptr [rax + 0x18]
000029ba  90                             nop      
000029bb  49 8b 4c 24 08                 mov      rcx, qword ptr [r12 + 8]
000029c0  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
000029c7  b8 10 00 00 00                 mov      eax, 0x10
000029cc  40 84 ff                       test     dil, dil
000029cf  4c 0f 45 e8                    cmovne   r13, rax
000029d3  4c 89 6d c8                    mov      qword ptr [rbp - 0x38], r13
000029d7  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
000029db  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
000029df  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
000029e4  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
000029e9  48 8b 01                       mov      rax, qword ptr [rcx]
000029ec  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
000029f0  48 8d 15 19 7f 02 00           lea      rdx, [rip + 0x27f19] ; InputTransferChar
000029f7  ff 50 18                       call     qword ptr [rax + 0x18]
000029fa  90                             nop      
000029fb  49 8b 4c 24 08                 mov      rcx, qword ptr [r12 + 8]
00002a00  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002a07  8b 7d 40                       mov      edi, dword ptr [rbp + 0x40]
00002a0a  48 89 7d c8                    mov      qword ptr [rbp - 0x38], rdi
00002a0e  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002a12  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002a16  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002a1b  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002a20  48 8b 01                       mov      rax, qword ptr [rcx]
00002a23  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002a27  48 8d 15 0a 7f 02 00           lea      rdx, [rip + 0x27f0a] ; OutputFormat
00002a2e  ff 50 18                       call     qword ptr [rax + 0x18]
00002a31  90                             nop      
00002a32  49 8b 4c 24 08                 mov      rcx, qword ptr [r12 + 8]
00002a37  c7 45 c0 02 00 00 00           mov      dword ptr [rbp - 0x40], 2
00002a3e  41 0f b6 c7                    movzx    eax, r15b
00002a42  ff c0                          inc      eax
00002a44  48 89 45 c8                    mov      qword ptr [rbp - 0x38], rax
00002a48  0f 10 45 c0                    movups   xmm0, xmmword ptr [rbp - 0x40]
00002a4c  0f 29 45 e0                    movaps   xmmword ptr [rbp - 0x20], xmm0
00002a50  f2 0f 10 4d d0                 movsd    xmm1, qword ptr [rbp - 0x30]
00002a55  f2 0f 11 4d f0                 movsd    qword ptr [rbp - 0x10], xmm1
00002a5a  48 8b 01                       mov      rax, qword ptr [rcx]
00002a5d  4c 8d 45 e0                    lea      r8, [rbp - 0x20]
00002a61  48 8d 15 f0 7e 02 00           lea      rdx, [rip + 0x27ef0] ; OutputColorRange
00002a68  ff 50 18                       call     qword ptr [rax + 0x18]
00002a6b  90                             nop      
00002a6c  49 8b 4c 24 08                 mov      rcx, qword ptr [r12 + 8]
00002a71  48 8b 01                       mov      rax, qword ptr [rcx]
00002a74  44 8b 75 54                    mov      r14d, dword ptr [rbp + 0x54]
00002a78  45 8b ce                       mov      r9d, r14d
00002a7b  44 8b c3                       mov      r8d, ebx
00002a7e  ba 03 00 00 00                 mov      edx, 3
00002a83  ff 90 88 00 00 00              call     qword ptr [rax + 0x88]
00002a89  85 c0                          test     eax, eax
00002a8b  75 26                          jne      0x180002ab3
00002a8d  49 8b 4c 24 10                 mov      rcx, qword ptr [r12 + 0x10]
00002a92  48 8b 01                       mov      rax, qword ptr [rcx]
00002a95  45 8b ce                       mov      r9d, r14d
00002a98  44 8b c3                       mov      r8d, ebx
00002a9b  8b d7                          mov      edx, edi
00002a9d  ff 90 88 00 00 00              call     qword ptr [rax + 0x88]
00002aa3  85 c0                          test     eax, eax
00002aa5  75 0c                          jne      0x180002ab3
00002aa7  8b 55 48                       mov      edx, dword ptr [rbp + 0x48]

; DX11 BGRA input allocation | bytes SHA256 846344353c9121a077cc423f184f9149a32537e69f253c9899dc926b1bf93103
00002c50  49 8b 4d 00                    mov      rcx, qword ptr [r13]
00002c54  48 c7 45 17 00 00 00 00        mov      qword ptr [rbp + 0x17], 0
00002c5c  48 8b 01                       mov      rax, qword ptr [rcx]
00002c5f  48 8d 55 17                    lea      rdx, [rbp + 0x17]
00002c63  48 89 54 24 28                 mov      qword ptr [rsp + 0x28], rdx
00002c68  44 89 74 24 20                 mov      dword ptr [rsp + 0x20], r14d
00002c6d  44 8b cb                       mov      r9d, ebx
00002c70  ba 03 00 00 00                 mov      edx, 3
00002c75  44 8b c2                       mov      r8d, edx
00002c78  ff 90 60 01 00 00              call     qword ptr [rax + 0x160]

; Converter output submitted to encoder | bytes SHA256 be9c3495ec8abdda5c290295163d4b45a434335e16743a14e2f6ec66452c4c40
000030a3  48 8b 4f 08                    mov      rcx, qword ptr [rdi + 8]
000030a7  48 8b 01                       mov      rax, qword ptr [rcx]
000030aa  48 8b d3                       mov      rdx, rbx
000030ad  ff 90 b0 00 00 00              call     qword ptr [rax + 0xb0]
000030b3  85 c0                          test     eax, eax
000030b5  75 49                          jne      0x180003100
000030b7  48 8b 4f 08                    mov      rcx, qword ptr [rdi + 8]
000030bb  48 89 75 f0                    mov      qword ptr [rbp - 0x10], rsi
000030bf  48 8b 01                       mov      rax, qword ptr [rcx]
000030c2  48 8d 55 f0                    lea      rdx, [rbp - 0x10]
000030c6  ff 90 b8 00 00 00              call     qword ptr [rax + 0xb8]
000030cc  85 c0                          test     eax, eax
000030ce  75 19                          jne      0x1800030e9
000030d0  48 8b 4f 10                    mov      rcx, qword ptr [rdi + 0x10]
000030d4  48 8b 01                       mov      rax, qword ptr [rcx]
000030d7  48 8b 55 f0                    mov      rdx, qword ptr [rbp - 0x10]
000030db  ff 90 b0 00 00 00              call     qword ptr [rax + 0xb0]
000030e1  85 c0                          test     eax, eax
000030e3  75 04                          jne      0x1800030e9
000030e5  b3 01                          mov      bl, 1
000030e7  eb 02                          jmp      0x1800030eb

; Encoder constructor bool argument capture | bytes SHA256 de3e70cadc34953d89925aa159f51310e31ee2e5d6cf637e95d5e1be51a8c495
00003d54  48 8b f9                       mov      rdi, rcx
00003d57  0f b6 f2                       movzx    esi, dl
00003d5a  b9 48 00 00 00                 mov      ecx, 0x48
00003d5f  e8 4c 06 00 00                 call     0x1800043b0
00003d64  33 ed                          xor      ebp, ebp

; Encoder constructor bool storage | bytes SHA256 0292f48cefd83a9ebab437d85e30f05d05d8d62ea753ee864f1a8600bcb0f42b
00003db9  40 88 73 44                    mov      byte ptr [rbx + 0x44], sil
00003dbd  48 8b 74 24 40                 mov      rsi, qword ptr [rsp + 0x40]
00003dc2  c7 43 18 01 00 00 00           mov      dword ptr [rbx + 0x18], 1
00003dc9  c7 43 40 78 00 00 00           mov      dword ptr [rbx + 0x40], 0x78

; AMFApplyCodec export wrapper | bytes SHA256 91378cedf1aa93f2d7fd29f12d2d3dd2109d345a3098a1b7caa73bcba8f173ba
00003e10  48 85 c9                       test     rcx, rcx
00003e13  74 20                          je       0x180003e35
00003e15  0f b6 44 24 38                 movzx    eax, byte ptr [rsp + 0x38]
00003e1a  88 44 24 38                    mov      byte ptr [rsp + 0x38], al
00003e1e  0f b6 44 24 30                 movzx    eax, byte ptr [rsp + 0x30]
00003e23  88 44 24 30                    mov      byte ptr [rsp + 0x30], al
00003e27  0f b6 44 24 28                 movzx    eax, byte ptr [rsp + 0x28]
00003e2c  88 44 24 28                    mov      byte ptr [rsp + 0x28], al
00003e30  e9 7b de ff ff                 jmp      0x180001cb0
