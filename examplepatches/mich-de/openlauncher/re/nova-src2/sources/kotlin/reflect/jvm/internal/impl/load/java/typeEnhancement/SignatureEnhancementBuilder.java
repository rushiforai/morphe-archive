package kotlin.reflect.jvm.internal.impl.load.java.typeEnhancement;

import a7.f;
import b70.c;
import b70.k;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Pair;
import kotlin.Unit;
import kotlin.collections.IndexedValue;
import kotlin.collections.IndexingIterable;
import kotlin.collections.IndexingIterator;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.jvm.internal.impl.load.kotlin.SignatureBuildingComponents;
import kotlin.reflect.jvm.internal.impl.resolve.jvm.JvmPrimitiveType;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
final class SignatureEnhancementBuilder {

    @NotNull
    private final Map<String, PredefinedFunctionEnhancementInfo> signatures = new LinkedHashMap();

    @NotNull
    public final Map<String, PredefinedFunctionEnhancementInfo> build() {
        return this.signatures;
    }

    public final class ClassEnhancementBuilder {

        @NotNull
        private final String className;
        final /* synthetic */ SignatureEnhancementBuilder this$0;

        public ClassEnhancementBuilder(@NotNull SignatureEnhancementBuilder signatureEnhancementBuilder, String className) {
            Intrinsics.g(className, "className");
            this.this$0 = signatureEnhancementBuilder;
            this.className = className;
        }

        public final void function(@NotNull String name, @NotNull Function1<? super FunctionEnhancementBuilder, Unit> block) {
            Intrinsics.g(name, "name");
            Intrinsics.g(block, "block");
            Map map = this.this$0.signatures;
            FunctionEnhancementBuilder functionEnhancementBuilder = new FunctionEnhancementBuilder(this, name);
            block.invoke(functionEnhancementBuilder);
            Pair<String, PredefinedFunctionEnhancementInfo> pairBuild = functionEnhancementBuilder.build();
            map.put(pairBuild.f71683a, pairBuild.f71684b);
        }

        @NotNull
        public final String getClassName() {
            return this.className;
        }

        @SourceDebugExtension
        public final class FunctionEnhancementBuilder {

            @NotNull
            private final String functionName;

            @NotNull
            private final List<Pair<String, TypeEnhancementInfo>> parameters;

            @NotNull
            private Pair<String, TypeEnhancementInfo> returnType;
            final /* synthetic */ ClassEnhancementBuilder this$0;

            public FunctionEnhancementBuilder(@NotNull ClassEnhancementBuilder classEnhancementBuilder, String functionName) {
                Intrinsics.g(functionName, "functionName");
                this.this$0 = classEnhancementBuilder;
                this.functionName = functionName;
                this.parameters = new ArrayList();
                this.returnType = new Pair<>("V", null);
            }

            @NotNull
            public final Pair<String, PredefinedFunctionEnhancementInfo> build() {
                SignatureBuildingComponents signatureBuildingComponents = SignatureBuildingComponents.INSTANCE;
                String className = this.this$0.getClassName();
                String str = this.functionName;
                List<Pair<String, TypeEnhancementInfo>> list = this.parameters;
                ArrayList arrayList = new ArrayList(c.u0(list, 10));
                Iterator<T> it = list.iterator();
                while (it.hasNext()) {
                    arrayList.add((String) ((Pair) it.next()).f71683a);
                }
                String strSignature = signatureBuildingComponents.signature(className, signatureBuildingComponents.jvmDescriptor(str, arrayList, (String) this.returnType.f71683a));
                TypeEnhancementInfo typeEnhancementInfo = (TypeEnhancementInfo) this.returnType.f71684b;
                List<Pair<String, TypeEnhancementInfo>> list2 = this.parameters;
                ArrayList arrayList2 = new ArrayList(c.u0(list2, 10));
                Iterator<T> it2 = list2.iterator();
                while (it2.hasNext()) {
                    arrayList2.add((TypeEnhancementInfo) ((Pair) it2.next()).f71684b);
                }
                return new Pair<>(strSignature, new PredefinedFunctionEnhancementInfo(typeEnhancementInfo, arrayList2));
            }

            public final void parameter(@NotNull String type, @NotNull JavaTypeQualifiers... qualifiers) {
                TypeEnhancementInfo typeEnhancementInfo;
                Intrinsics.g(type, "type");
                Intrinsics.g(qualifiers, "qualifiers");
                List<Pair<String, TypeEnhancementInfo>> list = this.parameters;
                if (qualifiers.length == 0) {
                    typeEnhancementInfo = null;
                } else {
                    IndexingIterable indexingIterable = new IndexingIterable(new f(qualifiers, 2));
                    int iD0 = k.d0(c.u0(indexingIterable, 10));
                    if (iD0 < 16) {
                        iD0 = 16;
                    }
                    LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                    Iterator it = indexingIterable.iterator();
                    while (true) {
                        IndexingIterator indexingIterator = (IndexingIterator) it;
                        if (!indexingIterator.f71738a.hasNext()) {
                            break;
                        }
                        IndexedValue indexedValue = (IndexedValue) indexingIterator.next();
                        linkedHashMap.put(Integer.valueOf(indexedValue.f71735a), (JavaTypeQualifiers) indexedValue.f71736b);
                    }
                    typeEnhancementInfo = new TypeEnhancementInfo(linkedHashMap);
                }
                list.add(new Pair<>(type, typeEnhancementInfo));
            }

            public final void returns(@NotNull JvmPrimitiveType type) {
                Intrinsics.g(type, "type");
                String desc = type.getDesc();
                Intrinsics.f(desc, "getDesc(...)");
                this.returnType = new Pair<>(desc, null);
            }

            public final void returns(@NotNull String type, @NotNull JavaTypeQualifiers... qualifiers) {
                Intrinsics.g(type, "type");
                Intrinsics.g(qualifiers, "qualifiers");
                IndexingIterable indexingIterable = new IndexingIterable(new f(qualifiers, 2));
                int iD0 = k.d0(c.u0(indexingIterable, 10));
                if (iD0 < 16) {
                    iD0 = 16;
                }
                LinkedHashMap linkedHashMap = new LinkedHashMap(iD0);
                Iterator it = indexingIterable.iterator();
                while (true) {
                    IndexingIterator indexingIterator = (IndexingIterator) it;
                    if (indexingIterator.f71738a.hasNext()) {
                        IndexedValue indexedValue = (IndexedValue) indexingIterator.next();
                        linkedHashMap.put(Integer.valueOf(indexedValue.f71735a), (JavaTypeQualifiers) indexedValue.f71736b);
                    } else {
                        this.returnType = new Pair<>(type, new TypeEnhancementInfo(linkedHashMap));
                        return;
                    }
                }
            }
        }
    }
}
