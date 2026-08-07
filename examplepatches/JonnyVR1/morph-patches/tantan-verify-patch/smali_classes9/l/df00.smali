.class public Ll/df00;
.super Landroid/text/style/ImageSpan;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIFZI)V
    .locals 12
    .param p9    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/cf00;

    .line 2
    .line 3
    const/16 v9, 0xe

    .line 4
    .line 5
    move-object v1, p1

    .line 6
    move-object v2, p2

    .line 7
    move v3, p3

    .line 8
    move/from16 v4, p4

    .line 9
    .line 10
    move/from16 v5, p5

    .line 11
    .line 12
    move/from16 v6, p6

    .line 13
    .line 14
    move/from16 v7, p7

    .line 15
    .line 16
    move/from16 v8, p8

    .line 17
    .line 18
    move/from16 v10, p11

    .line 19
    .line 20
    move/from16 v11, p12

    .line 21
    .line 22
    invoke-direct/range {v0 .. v11}, Ll/cf00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIZI)V

    .line 23
    .line 24
    .line 25
    move/from16 p1, p9

    .line 26
    .line 27
    move/from16 p3, p10

    .line 28
    .line 29
    invoke-virtual {v0, p1, p3}, Ll/cf00;->c(IF)Ll/cf00;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iput-object p2, p0, Ll/df00;->a:Ljava/lang/String;

    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;IIIIIFZI)V
    .locals 12

    .line 39
    new-instance v0, Ll/cf00;

    const/16 v9, 0xe

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v10, p9

    move/from16 v11, p10

    invoke-direct/range {v0 .. v11}, Ll/cf00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIZI)V

    invoke-direct {p0, v0, p2}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;Ljava/lang/String;)V

    .line 40
    iput-object p2, p0, Ll/df00;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/df00;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
