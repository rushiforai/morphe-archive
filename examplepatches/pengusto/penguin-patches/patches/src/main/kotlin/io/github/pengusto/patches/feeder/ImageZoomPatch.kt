package io.github.pengusto.patches.feeder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.*
import io.github.pengusto.patches.codeDigest

private const val native = "Lcom/nononsenseapps/feeder/ui/compose/html/LinearArticleContentKt;"
private const val model = "Lcom/nononsenseapps/feeder/model/html/LinearImage;"
private const val activity = "Lcom/nononsenseapps/feeder/ui/MainActivity;"
private const val runtime = "Lio/github/pengusto/patches/extension/feeder/ImageZoom;"
private const val hooks = "Lio/github/pengusto/patches/extension/feeder/FeederHooks;"
private const val continuation = "Lio/github/pengusto/patches/extension/feeder/ImageContinuation;"
private const val obj = "Ljava/lang/Object;"

@Suppress("unused")
val imageZoomPatch = bytecodePatch(
    name = "Zoom article images",
    description = "Open article images in a separate viewer with pinch, pan, double-tap and accessible zoom controls. Linked images offer View image or Open link. Uses Feeder's existing image loader and network policy. Official project F-Droid APK 2.25.0 only.",
    default = true,
) {
    compatibleWith(Compatibility(name = "Feeder", packageName = "com.nononsenseapps.feeder",
        targets = listOf(AppTarget(version = "2.25.0"))))
    extendWith("extensions/feeder.mpe")
    execute {
        mapOf(
            "Lb71;" to "c96926096936a69f304bba1a5e0675af1937d29eaf8739e13f8eb7d4dbb63c8f",
            "Lqp;" to "31324ce3638f1293131306f8e202ba93b5febb913c49546aaa26a8d0b22b1ab8",
            "Lc71;" to "dc305ff058fd59020d8c173b7ee62f919a10e8ceb66c06c0fc5f5b9c637149e5",
            "Lx13;" to "b05cc701d3256d01125743a58dc5ff3eb36d4411ad30ea33aec794a6f7f7b734",
            "Ljr2;" to "0f80aab1a343930b4430918a734883755029aeb9d4f336b8e43d42df2deb6752",
            "Lbp1;" to "33c8737c20bc62fcbbd99cff3c80e704b17c99b4f9e1e6ad70c1264be5139f5a",
            "Lcom/nononsenseapps/feeder/FeederApplication;" to "b5ec9363a867d3cb033c97c310b742e385bc69050d71138fdeb3bf3048fe1e4c",
            "Lcom/nononsenseapps/feeder/model/html/LinearImage;" to "342719d47eed61299314270e504e4f25e6a8af155addedb89d7442b50ad92988",
            "Lcom/nononsenseapps/feeder/model/html/LinearImageSource;" to "b17e9560f6705bf4cd6749f6f6b48411438dcb0f026b073493bd5171f944423a",
            "Lcom/nononsenseapps/feeder/model/html/LinearText;" to "86b9ae6f15944c4101d764502c847ff1773606a029287d1bfc7088d25aede0e6",
            "Lcom/nononsenseapps/feeder/ui/MainActivity;" to "b8c7077da511762ef72c2b018edf123377df1b586f120bff1cdb371c2421325e",
            "Lcom/nononsenseapps/feeder/ui/compose/html/LinearArticleContentKt;" to "2e50f6099427f925009209835ad946bdb5700f452350ce4591790bd579a5301d",
            "Lcs2;" to "d0ddca391de669a1a7d2864e50a8804e8f1f51731a7aec990b35c4f970d58353",
            "Ld27;" to "736eb457952bd44e4c8bcb5a21f7f9be54f0ad4ef41d928925ce601894e14141",
            "Lee0;" to "e0ca87a10e20c04baccd5a2a5707734e951b07bdc81d9d71fa7f4dab5f4d69cc",
            "Lr13;" to "c3db186cb8b0ad913ccbf382709f92589d4f071091192e19784e539ad806a064",
            "Lgs2;" to "9ea94c97dfeb44a75448abb26d193c8273b6086a52da0b0ae0d9fc4d484fb9fa",
            "Lgt6;" to "2df938440aee3103095c78b0bad96c51ac40548514a427beaf90dd0c142cde69",
            "Lhu1;" to "c4fab4b1e322ec3323fa60d45f879943b8119ba148a6d1ddff7d2aafed5809d7",
            "Ls81;" to "5cb1f820bca4d54cefaa78e99316ea48b379ec1b7c0118ec6153f74cf79fa77a",
            "Luv5;" to "5fc80cab4eb5809ab5f5073a9407638168ac698c0f27d42e932f25c238135688",
            "Luc2;" to "49478a19ba9cb8be272e881e7c5ff4ca226ad6711b642d2f493ea27ae52a68ca",
            "Lpk7;" to "1e7c00fda864cc2f311204539cdb23584636fa6c9b6cce4351fc8cf56ab8896e",
            "Lcom/nononsenseapps/feeder/ui/compose/feedarticle/ReaderViewKt;" to "7baec984856a061734fe1e3e937b9da62d4b86b2358d20715857849740a06d26",
            "Lgm7;" to "d31194494809173c54860c23af843b557ec63f26ea0ca6c2e3656bc57a03233a",
        ).forEach { (type, expected) ->
            check(classDefBy(type).codeDigest() == expected) {
                "Unsupported or already patched Feeder bytecode: $type. Use the original official project F-Droid 2.25.0 APK."
            }
        }
        fun method(owner: String, name: String): MutableMethod = mutableClassDefBy(owner).methods.single { it.name == name }
        fun bind(name: String, registers: Int, code: String) {
            val old = method(hooks, name)
            val replacement = MutableMethod(ImmutableMethod(hooks, old.name, old.parameters,
                old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
                ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
            replacement.addInstructions(0, code.trimIndent())
            mutableClassDefBy(hooks).methods.apply { check(remove(old)); add(replacement) }
        }
        method(activity, "onResume").addInstructions(0, "invoke-static {p0}, $runtime->bind(Landroid/app/Activity;)V")
        method(activity, "onStop").addInstructions(0, "invoke-static {p0}, $runtime->unbind(Landroid/app/Activity;)V")
        val click = method(native, "LinearImageContent\$lambda\$1\$0\$0\$0")
        val follow = MutableMethod(ImmutableMethod(native, "PenguinFollowImageLink", click.parameters,
            click.returnType, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            click.annotations, click.hiddenApiRestrictions, click.implementation))
        mutableClassDefBy(native).methods.add(follow)
        click.addInstructions(0, """
            invoke-static/range {p0 .. p2}, $runtime->click($obj$obj$obj)Z
            move-result v0
            if-eqz v0, :native_link
            sget-object v0, Lgm7;->a:Lgm7;
            return-object v0
            :native_link
            nop
        """.trimIndent())
        // v9 is the enabled argument of this exact guarded article-image clickable.
        method(native, "LinearImageContent\$lambda\$1\$0").addInstructions(48, "const/4 v9, 0x1")
        // At this guarded header-image AsyncImage call v3=request, v4=caption,
        // v5=modifier. The original parameter registers have already been reused.
        method("Lcom/nononsenseapps/feeder/ui/compose/feedarticle/ReaderViewKt;",
            "ReaderView\$lambda\$1\$0\$1\$3\$0\$0").addInstructions(92, """
            invoke-static {v3, v5, v4}, $runtime->header($obj${obj}Ljava/lang/String;)$obj
            move-result-object v5
            check-cast v5, Lex3;
        """.trimIndent())
        bind("requestUri", 1, """
            check-cast p0, Lgs2;
            iget-object p0, p0, Lgs2;->b:Ljava/lang/Object;
            check-cast p0, Ljava/lang/String;
            return-object p0
        """)
        bind("clickType", 1, "const-class v0, Luc2;\nreturn-object v0")
        bind("unit", 1, "sget-object v0, Lgm7;->a:Lgm7;\nreturn-object v0")
        bind("clickable", 9, """
            move-object v0, p0
            check-cast v0, Lex3;
            const/4 v1, 0x1
            move-object v2, p2
            const/4 v3, 0x0
            move-object v4, p1
            check-cast v4, Luc2;
            const/4 v5, 0x0
            invoke-static/range {v0 .. v5}, Lpk7;->e(Lex3;ZLjava/lang/String;Lz76;Luc2;I)Lex3;
            move-result-object v0
            return-object v0
        """)
        bind("sources", 1, """
            check-cast p0, $model
            invoke-virtual {p0}, $model->getSources()Ljava/util/List;
            move-result-object p0
            return-object p0
        """)
        bind("sourceUri", 1, """
            check-cast p0, Lcom/nononsenseapps/feeder/model/html/LinearImageSource;
            invoke-virtual {p0}, Lcom/nononsenseapps/feeder/model/html/LinearImageSource;->getImgUri()Ljava/lang/String;
            move-result-object p0
            return-object p0
        """)
        bind("sourceWidth", 2, """
            check-cast p0, Lcom/nononsenseapps/feeder/model/html/LinearImageSource;
            invoke-virtual {p0}, Lcom/nononsenseapps/feeder/model/html/LinearImageSource;->getScreenWidth()Ljava/lang/Integer;
            move-result-object v0
            if-nez v0, :value
            invoke-virtual {p0}, Lcom/nononsenseapps/feeder/model/html/LinearImageSource;->getWidthPx()Ljava/lang/Integer;
            move-result-object v0
            if-nez v0, :value
            const/4 v0, 0x0
            return v0
            :value
            invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I
            move-result v0
            return v0
        """)
        bind("sourceDensity", 1, """
            check-cast p0, Lcom/nononsenseapps/feeder/model/html/LinearImageSource;
            invoke-virtual {p0}, Lcom/nononsenseapps/feeder/model/html/LinearImageSource;->getPixelDensity()Ljava/lang/Float;
            move-result-object p0
            if-eqz p0, :none
            invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F
            move-result p0
            return p0
            :none
            const/4 p0, 0x0
            return p0
        """)
        bind("link", 1, """
            check-cast p0, $model
            invoke-virtual {p0}, $model->getLink()Ljava/lang/String;
            move-result-object p0
            return-object p0
        """)
        bind("caption", 1, """
            check-cast p0, $model
            invoke-virtual {p0}, $model->getCaption()Lcom/nononsenseapps/feeder/model/html/LinearText;
            move-result-object p0
            if-eqz p0, :none
            invoke-virtual {p0}, Lcom/nononsenseapps/feeder/model/html/LinearText;->getText()Ljava/lang/String;
            move-result-object p0
            return-object p0
            :none
            const/4 p0, 0x0
            return-object p0
        """)
        bind("follow", 3, """
            check-cast p0, $model
            check-cast p1, Ljava/util/Map;
            check-cast p2, Ljd2;
            invoke-static {p0, p1, p2}, $native->PenguinFollowImageLink(${model}Ljava/util/Map;Ljd2;)Lgm7;
            return-void
        """)
        bind("job", 2, """
            new-instance v0, Lr13;
            const/4 v1, 0x0
            invoke-direct {v0, v1}, Lr13;-><init>(Lp13;)V
            return-object v0
        """)
        bind("cancel", 2, """
            check-cast p0, Lx13;
            const/4 v0, 0x0
            invoke-virtual {p0, v0}, Lx13;->i(Ljava/util/concurrent/CancellationException;)V
            return-void
        """)
        bind("continuation", 1, "const-class v0, Lb71;\nreturn-object v0")
        bind("suspended", 1, "sget-object v0, Ls81;->a:Ls81;\nreturn-object v0")
        val cont = mutableClassDefBy(continuation)
        cont.setSuperClass("Lc71;")
        val oldCtor = method(continuation, "<init>")
        val ctor = MutableMethod(ImmutableMethod(continuation, oldCtor.name, oldCtor.parameters,
            oldCtor.returnType, oldCtor.accessFlags, oldCtor.annotations, oldCtor.hiddenApiRestrictions,
            ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())))
        ctor.addInstructions(0, """
            check-cast p1, Lb71;
            invoke-direct {p0, p1}, Lc71;-><init>(Lb71;)V
            return-void
        """.trimIndent())
        cont.methods.apply { check(remove(oldCtor)); add(ctor) }
        bind("execute", 7, """
            new-instance v0, Lcs2;
            invoke-direct {v0, p0}, Lcs2;-><init>(Landroid/content/Context;)V
            iput-object p1, v0, Lcs2;->c:Ljava/lang/Object;
            const/16 v1, 0x9c4
            invoke-static {v1, v1}, Lhu1;->e(II)Lgt6;
            move-result-object v1
            invoke-virtual {v0, v1}, Lcs2;->b(Lgt6;)V
            invoke-virtual {v0}, Lcs2;->a()Lgs2;
            move-result-object v0
            move-object v1, p0
            check-cast v1, Lcom/nononsenseapps/feeder/FeederApplication;
            invoke-virtual {v1, p0}, Lcom/nononsenseapps/feeder/FeederApplication;->newImageLoader(Landroid/content/Context;)Lrr2;
            move-result-object v1
            check-cast v1, Luv5;
            new-instance v2, $continuation
            invoke-direct {v2, p2}, $continuation-><init>($obj)V
            invoke-virtual {v1, v0, v2}, Luv5;->b(Lgs2;Lc71;)Ljava/lang/Object;
            move-result-object v0
            return-object v0
        """)
        bind("image", 2, """
            instance-of v0, p0, Ld27;
            if-eqz v0, :error
            check-cast p0, Ld27;
            invoke-virtual {p0}, Ld27;->getImage()Ljr2;
            move-result-object p0
            return-object p0
            :error
            const/4 p0, 0x0
            return-object p0
        """)
        for ((name, target) in mapOf("width" to "b", "height" to "a")) bind(name, 1, """
            check-cast p0, Ljr2;
            invoke-interface {p0}, Ljr2;->$target()I
            move-result p0
            return p0
        """)
        bind("draw", 2, """
            check-cast p0, Ljr2;
            invoke-interface {p0, p1}, Ljr2;->d(Landroid/graphics/Canvas;)V
            return-void
        """)
        bind("drawable", 4, """
            instance-of v0, p1, Lee0;
            if-eqz v0, :drawable
            check-cast p1, Lee0;
            iget-object p1, p1, Lee0;->a:Landroid/graphics/Bitmap;
            invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
            move-result-object p0
            new-instance v0, Landroid/graphics/drawable/BitmapDrawable;
            invoke-direct {v0, p0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/content/res/Resources;Landroid/graphics/Bitmap;)V
            return-object v0
            :drawable
            instance-of v0, p1, Lbp1;
            if-eqz v0, :other
            check-cast p1, Lbp1;
            iget-object p1, p1, Lbp1;->a:Landroid/graphics/drawable/Drawable;
            return-object p1
            :other
            const/4 p1, 0x0
            return-object p1
        """)
    }
}
