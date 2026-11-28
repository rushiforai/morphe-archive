"""Check sources, compiled dependencies and packages without network/original-workspace access."""
from pathlib import Path
from verify_current import long_path
import argparse,hashlib,json,re,zipfile,io
from struct import unpack_from
R=Path(__file__).resolve().parents[1]
PREFIX='app/yydarlinker/aicaptions/'
CORE_BANNED=['CaptionRuntimePorts','CaptionSession','CaptionOverlay','CaptionActions','AiCaptionConfig','SecureApiKey','AiCaptionHook','CaptionStrings','CaptionPlayer','CaptionSurface','NativeCaptionBridge','RawCaptionSource','SourceCaptionCache','ProviderModelCatalog']
COMPILED_CORE_BANNED = re.compile(
    r'app[./]yydarlinker[./]aicaptions[./](?:[a-z]+[./])?(?:' + '|'.join(CORE_BANNED) + r')\b'
)
UI_BANNED=['RebuildController','RebuildApi','RebuildProtocol','RebuildPlanner','TranslationRuntime','ProviderRequestPolicy','MeaningTransport','MeaningWire','CaptionCore']
DEAD=['app/yydarlinker/caption/core/CaptionCore','MeaningTransport','MeaningWire','MeaningPlannerWire','PlainMeaningWire','BatchMeaningWire','SourcePreparationWire','N39Application','RebuildSourcePlan','RebuildSemanticTimeline','RebuildSemanticStore','RebuildSupplyPolicy','RelationCandidate','FrozenDev3','CaptionSemanticUnit','CaptionRenderFrame','CaptionPageScheduler','CaptionPresentationCursor','CaptionPresentationState','MeaningPager','SentenceCandidate','TranslationRetryPolicy']
def sha(data):return hashlib.sha256(data).hexdigest()

HOST_ABI = {
    'AiCaptionHook': (
        'onVideoId(Ljava/lang/String;)V', 'onPlayerType(Ljava/lang/Enum;)V', 'onVideoTime(J)V',
        'onPlayerControlsVisibility(Ljava/lang/Enum;)V',
        'onNativeCaptionButtonController(Landroid/widget/ImageView;)V',
        'onTimedTextRequest(Ljava/lang/Object;Ljava/lang/String;)V',
    ),
    'NativeCaptionBridge': (
        'onOriginalTrackList(Ljava/util/List;)V', 'onNativeTrackApplied(Ljava/lang/Object;Ljava/lang/Object;)V',
        'onNativeAppliedEvent(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/String;)V',
        'suppressNativeDraw()Z', 'onNativeRendererAttached(Landroid/view/View;)V',
        'nativeModelVideo(Ljava/lang/Object;)Ljava/lang/String;',
        'nativeTracks(Ljava/lang/Object;)Ljava/util/List;', 'language(Ljava/lang/Object;)Ljava/lang/String;',
        'vss(Ljava/lang/Object;)Ljava/lang/String;', 'url(Ljava/lang/Object;)Ljava/lang/String;',
    ),
    'CaptionAddonSupport': ('initialize(Landroid/app/Activity;)V', 'aiInstalled()Z'),
    'CaptionQuickToggle': (
        'onMenu(Ljava/lang/Object;I)I', 'observeMenuPath(Ljava/lang/CharSequence;[B)V',
        'onShortsStateChanged()V', 'shortsOpen()Z', 'topMenu()Z', 'dismissNative()V',
        'nativeContainer(Ljava/lang/Object;)Landroid/widget/LinearLayout;',
        'addNativeRow(Ljava/lang/Object;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Landroid/view/View$OnClickListener;I)I',
    ),
}
RETIRED_HOOK_METHODS = {'onNativeSelection', 'onNativeSelectionWithReason',
                        'onNativeSelectionApplied', 'translatedTracks', 'rewriteUrl'}


def host_abi(dex_files):
    """Read defined DEX methods, including access flags, separately from method references."""
    wanted = {'L' + PREFIX + ('settings/' if name == 'CaptionQuickToggle' else 'host/') + name + ';': name
              for name in HOST_ABI}
    actual = {name: set() for name in HOST_ABI}
    errors = []
    for data in dex_files:
        def uleb(offset):
            value = 0
            for shift in range(0, 35, 7):
                byte = data[offset]
                offset += 1
                value |= (byte & 127) << shift
                if byte < 128:
                    return value, offset
            raise ValueError('invalid DEX ULEB128')

        def u32(offset):
            return unpack_from('<I', data, offset)[0]

        def string(index):
            _, offset = uleb(u32(strings + 4 * index))
            return data[offset:data.index(0, offset)].decode('utf-8', 'replace')

        assert data.startswith(b'dex\n'), 'invalid extension DEX'
        strings, types, prototypes, methods = (u32(offset) for offset in (60, 68, 76, 92))

        def descriptor(index):
            return string(u32(types + 4 * index))

        for index in range(u32(96)):
            definition = u32(100) + 32 * index
            owner = wanted.get(descriptor(u32(definition)))
            if owner is None:
                continue
            offset, counts = u32(definition + 24), []
            if not offset or not u32(definition + 4) & 1:
                errors.append('missing public host class data: ' + owner)
                continue
            for _ in range(4):
                count, offset = uleb(offset)
                counts.append(count)
            for _ in range(2 * sum(counts[:2])):
                _, offset = uleb(offset)
            for count in counts[2:]:
                method_index = 0
                for _ in range(count):
                    delta, offset = uleb(offset)
                    access, offset = uleb(offset)
                    _, offset = uleb(offset)
                    method_index += delta
                    _, prototype, name_index = unpack_from('<HHI', data, methods + 8 * method_index)
                    name = string(name_index)
                    if name in RETIRED_HOOK_METHODS:
                        errors.append(f'retired hook method defined: {owner}.{name}')
                    if access & 9 != 9:
                        continue
                    _, result, parameters = unpack_from('<III', data, prototypes + 12 * prototype)
                    args = '' if not parameters else ''.join(
                        descriptor(unpack_from('<H', data, parameters + 4 + 2 * i)[0])
                        for i in range(u32(parameters)))
                    actual[owner].add(f'{name}({args}){descriptor(result)}')
    for owner, expected in HOST_ABI.items():
        errors.extend(f'missing public static host ABI: {owner}.{method}' for method in sorted(set(expected) - actual[owner]))
    return errors

# Source ownership, rather than a list of future helper names, defines these edges.
# Scan the entire extension, including helpers outside the responsibility folders.
EXTENSION = 'extensions/extension'
EXTENSION_FOLDERS = ('host', 'settings', 'source', 'overlay', 'diagnostics')
SOURCE_AREAS = ('caption-contracts', 'caption-shared', 'translation-core', EXTENSION, 'patches')
EXTENSION_AREAS = {EXTENSION, *EXTENSION_FOLDERS}
SOURCE_FORBIDDEN = {
    'translation-core': EXTENSION_AREAS | {'patches'},
    'caption-shared': EXTENSION_AREAS | {'translation-core', 'patches'},
    'caption-contracts': EXTENSION_AREAS | {'caption-shared', 'translation-core', 'patches'},
    'overlay': {'translation-core'},
    'settings': {'translation-core'},
    'diagnostics': {'translation-core'},
}

def source_area(root, path, module, language):
    if module == EXTENSION and language == 'java':
        parts = path.relative_to(root / EXTENSION / 'src/main/java').parts
        if len(parts) >= 5 and parts[:3] == ('app', 'yydarlinker', 'aicaptions') and parts[3] in EXTENSION_FOLDERS:
            return parts[3]
    return module

def source_code(text):
    """Erase comments and literals in one pass, so URLs cannot eat following code.

    Java/Kotlin strings, text blocks/raw strings, chars and nested Kotlin block comments
    are ignored. Java Unicode escapes are expanded before tokenization (JLS ordering).
    Kotlin interpolation/dynamic lookup is outside this lexical guard's scope.
    """
    text = re.sub(r'\\u+([0-9a-fA-F]{4})', lambda m: chr(int(m[1], 16)), text)
    out = []; at = 0
    token = re.compile(r'//[^\n]*|/\*|"""[\s\S]*?"""|"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'')
    while (match := token.search(text, at)):
        out.append(text[at:match.start()]); end = match.end()
        if match.group() == '/*':
            depth = 1
            while depth and end < len(text):
                if text.startswith('/*', end): depth += 1; end += 2
                elif text.startswith('*/', end): depth -= 1; end += 2
                else: end += 1
        erased = text[match.start():end]
        out.append(''.join('\n' if c == '\n' else ' ' for c in erased)); at = end
    out.append(text[at:]); return ''.join(out)

def source_dependencies(root):
    """Discover top-level project types, then reject references across forbidden areas.

    Imports (including static/wildcard and Kotlin aliases), qualified references and
    same-package simple names are checked. Unknown external/generated types, ambiguous
    shadowing and runtime/reflection edges require review or separate package checks.
    """
    units = []; owners = {}
    for module in SOURCE_AREAS:
        for language in ('java', 'kotlin'):
            for path in sorted((root / module / 'src/main' / language).rglob('*')):
                if path.suffix not in ('.java', '.kt'): continue
                area = source_area(root, path, module, language)
                code = source_code(path.read_text(encoding='utf-8-sig'))
                package = re.search(r'\bpackage\s+([\w.]+)', code)
                package = package[1] if package else ''
                depth = 0; types = []
                for m in re.finditer(r'[{}]|\b(?:class|interface|enum|record|object|typealias)\s+(\w+)', code):
                    if m.group() == '{': depth += 1
                    elif m.group() == '}': depth -= 1
                    elif depth == 0: types.append(m[1])
                for name in types: owners.setdefault(package + '.' + name, set()).add(area)
                units.append((path, area, package, code))
    errors = []
    for path, area, package, code in units:
        forbidden = SOURCE_FORBIDDEN.get(area, set())
        if not forbidden: continue
        # Dotted tokens cover imports, nested types and static methods too.
        refs = set(re.findall(r'\b[A-Za-z_$][\w$]*(?:\s*\.\s*[A-Za-z_$][\w$]*)*', code))
        refs = {re.sub(r'\s+', '', value) for value in refs}
        imports = re.findall(r'\bimport\s+(?:static\s+)?([\w.]+(?:\*)?)', code)
        for fq, target_areas in owners.items():
            if not target_areas.intersection(forbidden): continue
            target_package, name = fq.rsplit('.', 1)
            qualified = any(ref == fq or ref.startswith(fq + '.') for ref in refs)
            imported = any(value == fq or value.startswith(fq + '.')
                           or value == target_package + '.*' for value in imports)
            local = package == target_package and any(ref == name or ref.startswith(name + '.') for ref in refs)
            if qualified or imported or local:
                errors.append(f'{path.relative_to(root).as_posix()} depends on {fq} '
                              f'[{area} -> {",".join(sorted(target_areas.intersection(forbidden)))}]')
        if area == 'translation-core' and re.search(r'\bandroid\.(app|view|widget)\.', code):
            errors.append(f'{path.relative_to(root).as_posix()} references an Android UI component')
    return dict(errors=sorted(set(errors)), source_files=len(units), project_types=len(owners),
                scope='Lexical Java/Kotlin main-source ownership; no reflection/runtime reachability proof')

def constants(path):
    data=long_path(path).read_bytes();assert data[:4]==b'\xca\xfe\xba\xbe'
    count=int.from_bytes(data[8:10],'big');at=10;i=1;out=[]
    while i<count:
        tag=data[at];at+=1
        if tag==1:
            size=int.from_bytes(data[at:at+2],'big');at+=2;out.append(data[at:at+size].decode('utf-8','replace'));at+=size
        elif tag in (7,8,16,19,20):at+=2
        elif tag in (9,10,11,12,17,18,3,4):at+=4
        elif tag in (5,6):at+=8;i+=1
        elif tag==15:at+=3
        else:raise ValueError(f'unknown constant tag {tag}')
        i+=1
    return out
def inspect(source_only=False,core_classes=None,mpp=None,mpe=None):
    errors=[];facts={}
    dependencies = source_dependencies(R)
    errors.extend(dependencies['errors'])
    facts['source_dependencies'] = dependencies
    for module in ('translation-core', 'caption-shared', EXTENSION):
        for path in (R/module/'src/main/java').rglob('*.java'):
            area = source_area(R, path, module, 'java')
            banned = (CORE_BANNED if area == 'translation-core' else CORE_BANNED + UI_BANNED
                      if area == 'caption-shared' else UI_BANNED
                      if area in ('overlay', 'settings', 'diagnostics') else ())
            if not banned: continue
            source=source_code(path.read_text(encoding='utf-8-sig'))
            for name in banned:
                if re.search(r'\b'+name+r'\b',source):errors.append(f'{path.relative_to(R)} depends on {name}')
            if module=='translation-core' and re.search(r'\bimport\s+android\.(app|view|widget)\.',source):errors.append(f'{path.relative_to(R)} imports a UI component')
    for name in ('LICENSE', 'NOTICE'):
        if not (R/name).is_file(): errors.append('missing root legal file: '+name)
    settings=(R/'settings.gradle.kts').read_text(encoding='utf-8-sig')
    if ':caption-core' in settings or 'archive/' in settings:errors.append('retired implementation included in Gradle settings')
    if not source_only:
        if any(p is None for p in (core_classes,mpp,mpe)):
            facts['errors']=['full inspection requires explicit core classes, MPP, standalone MPE from this build']
            return facts
        classes=list(core_classes.rglob('*.class'))
        if not classes:errors.append('core compiled classes missing')
        for path in classes:
            for value in constants(path):
                if COMPILED_CORE_BANNED.search(value):
                    errors.append(f'compiled core depends on app/UI: {path.name}: {value}')
        facts['compiled_core_class_count']=len(classes)
        if not mpp.is_file():errors.append('specified Android MPP missing; run :patches:buildAndroid')
        else:
            with zipfile.ZipFile(mpp) as z:
                names=z.namelist();embedded=[n for n in names if n.endswith('.mpe')]
                if 'classes.dex' not in names:errors.append('Manager root classes.dex missing from MPP')
                if len(embedded)!=1:errors.append('expected exactly one embedded MPE')
                else:
                    embedded_bytes=z.read(embedded[0]);independent=[mpe] if mpe.is_file() and mpe.read_bytes()==embedded_bytes else []
                    if not independent:errors.append('embedded MPE differs from standalone MPE')
                    if embedded_bytes.startswith(b'dex\n'):dex_files=[embedded_bytes]
                    elif zipfile.is_zipfile(io.BytesIO(embedded_bytes)):
                        with zipfile.ZipFile(io.BytesIO(embedded_bytes)) as ext:dex_files=[ext.read(n) for n in ext.namelist() if n.endswith('.dex')]
                    else:dex_files=[]
                    if not dex_files:errors.append('extension DEX missing')
                    errors.extend(host_abi(dex_files))
                    dex=b''.join(dex_files)
                    for dead in DEAD + ['DeepSeekCaptionHookV2','CaptionSessionReconciler','CaptionPlayerTransitionGuard','CaptionMusicSuppressor']:
                        if dead.encode() in dex:errors.append('retired core still packaged: '+dead)
                    live_classes = ('RebuildController', 'RebuildApi', 'RebuildProtocol',
                                    'host/CaptionRuntimePorts', 'host/CaptionSession', 'host/CaptionPlayer')
                    for live in live_classes:
                        if f'L{PREFIX}{live};'.encode() not in dex:
                            errors.append('production class absent: ' + live)
                    for fixture in ['CoreSessionIntegrationTest','PinnedCoreLiveTest','org/robolectric']:
                        if fixture.encode() in dex:errors.append('test/preview implementation packaged in production: '+fixture)
                    facts['android_patch']={'path':str(mpp.resolve()),'sha256':sha(mpp.read_bytes()),'size':mpp.stat().st_size,'manager_dex':True,'embedded_mpe_sha256':sha(embedded_bytes),'standalone_mpe':[str(p.resolve()) for p in independent],'embedded_mpe_equal_to_standalone':bool(independent),'host_abi_methods':sum(map(len, HOST_ABI.values()))}
                locales=[n for n in names if n.endswith('caption_addon_strings.xml')]
                facts['packaged_locale_files']=len(locales)
                if len(locales)!=14:errors.append(f'expected 14 packaged locale files, got {len(locales)}')
                for name in locales+['captionlocales/index.txt']:
                    source=R/'patches/src/main/resources'/name
                    if not source.is_file() or source.read_bytes()!=z.read(name):errors.append('packaged resource differs from current source: '+name)
    facts['errors']=errors;facts['scope']='Main source ownership and legacy name guards; compiled constants scan only the supplied core classes, not the extension; package exclusions are checked against the supplied MPP. No dynamic/reflection reachability, OEM or semantic-quality certification.'
    return facts
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--source-only',action='store_true');p.add_argument('--output',type=Path,default=R/'validation/boundaries.json')
    for name in ('core-classes','mpp','mpe'):p.add_argument('--'+name,type=Path)
    a=p.parse_args()
    result=inspect(a.source_only,a.core_classes,a.mpp,a.mpe);a.output.parent.mkdir(parents=True,exist_ok=True);a.output.write_text(json.dumps(result,ensure_ascii=False,indent=2),encoding='utf-8')
    print(json.dumps(result,ensure_ascii=False,indent=2));raise SystemExit(bool(result['errors']))
