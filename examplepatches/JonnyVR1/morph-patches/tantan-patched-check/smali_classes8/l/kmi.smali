.class public Ll/kmi;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "vec4 blendBaseAlpha(vec4 Cb, vec4 Cs, vec4 B) {\n   vec4 Cr = vec4((1.0 - Cb.a) * Cs.rgb + Cb.a * clamp(B.rgb, 0.0, 1.0), Cs.a);\n   return normalBlend(Cb, Cr);\n}\n"

    .line 2
    .line 3
    return-object v0
.end method

.method public static b(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/kmi;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-static {}, Ll/kmi;->d()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method private static c()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "vec4 normalBlend(vec4 Cb, vec4 Cs) {\n   vec4 dst = premultiply(Cb);\n   vec4 src = premultiply(Cs);\n   return unpremultiply(src + dst * (1.0 - src.a));\n}\n"

    .line 2
    .line 3
    return-object v0
.end method

.method private static d()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "vec4 normalBlend(vec4 Cb, vec4 Cs) {\n   vec4 dst = Cb;\n   vec4 src = Cs;\n   return src + dst * (1.0 - src.a);\n}\n"

    .line 2
    .line 3
    return-object v0
.end method

.method public static e()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "vec4 premultiply(vec4 s) {\n   return vec4(s.rgb * s.a, s.a);\n}\n"

    .line 2
    .line 3
    return-object v0
.end method

.method public static f()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "vec4 screenBlend(vec4 Cb, vec4 Cs) {\n    vec4 White = vec4(1.0);\n    vec4 B = White - ((White - Cs) * (White - Cb));\n    return blendBaseAlpha(Cb, Cs, B);\n}\n"

    .line 2
    .line 3
    return-object v0
.end method

.method public static g()Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "vec4 unpremultiply(vec4 s) {\n   return vec4(s.rgb / max(s.a, 0.00001), s.a);\n}\n"

    .line 2
    .line 3
    return-object v0
.end method
