.class public Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;
.super Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;
.implements Ll/y20;
.implements Ll/yyl;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;",
        "Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct$a;",
        "Ll/y20<",
        "Ll/uyh0;",
        ">;",
        "Ll/yyl;"
    }
.end annotation


# static fields
.field public static C:I = 0x1

.field public static D:I


# instance fields
.field public A:Ll/r0y;

.field public B:Ll/z0y;

.field public l:I

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:I

.field public s:Ljava/lang/String;

.field public t:Lcom/p1/mobile/putong/data/Gender;

.field public u:Ljava/lang/String;

.field public v:Z

.field public w:I

.field public x:Lv/VText;

.field public y:Landroid/view/View;

.field public z:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->w:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->o2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->n2(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->p2()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static d2(Landroid/content/Context;IZZZ)Landroid/content/Intent;
    .locals 8

    .line 1
    sget v6, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    const/4 v5, 0x0

    .line 5
    move-object v0, p0

    .line 6
    move v1, p1

    .line 7
    move v2, p2

    .line 8
    move v3, p3

    .line 9
    move v4, p4

    .line 10
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->g2(Landroid/content/Context;IZZZLjava/lang/String;IZ)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static e2(Landroid/content/Context;IZZZLjava/lang/String;)Landroid/content/Intent;
    .locals 8

    .line 1
    sget v6, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 2
    .line 3
    const/4 v7, 0x0

    .line 4
    move-object v0, p0

    .line 5
    move v1, p1

    .line 6
    move v2, p2

    .line 7
    move v3, p3

    .line 8
    move v4, p4

    .line 9
    move-object v5, p5

    .line 10
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->g2(Landroid/content/Context;IZZZLjava/lang/String;IZ)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static g2(Landroid/content/Context;IZZZLjava/lang/String;IZ)Landroid/content/Intent;
    .locals 10

    .line 1
    const/4 v8, 0x0

    .line 2
    const/4 v9, 0x0

    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object v5, p5

    .line 9
    move/from16 v6, p6

    .line 10
    .line 11
    move/from16 v7, p7

    .line 12
    .line 13
    invoke-static/range {v0 .. v9}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->h2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static h2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;)Landroid/content/Intent;
    .locals 11

    .line 1
    const-string v10, ""

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move v1, p1

    .line 5
    move v2, p2

    .line 6
    move v3, p3

    .line 7
    move v4, p4

    .line 8
    move-object/from16 v5, p5

    .line 9
    .line 10
    move/from16 v6, p6

    .line 11
    .line 12
    move/from16 v7, p7

    .line 13
    .line 14
    move/from16 v8, p8

    .line 15
    .line 16
    move-object/from16 v9, p9

    .line 17
    .line 18
    invoke-static/range {v0 .. v10}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->i2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public static i2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;)Landroid/content/Intent;
    .locals 12

    .line 1
    const/4 v11, 0x1

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move v2, p2

    .line 5
    move v3, p3

    .line 6
    move/from16 v4, p4

    .line 7
    .line 8
    move-object/from16 v5, p5

    .line 9
    .line 10
    move/from16 v6, p6

    .line 11
    .line 12
    move/from16 v7, p7

    .line 13
    .line 14
    move/from16 v8, p8

    .line 15
    .line 16
    move-object/from16 v9, p9

    .line 17
    .line 18
    move-object/from16 v10, p10

    .line 19
    .line 20
    invoke-static/range {v0 .. v11}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->k2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public static k2(Landroid/content/Context;IZZZLjava/lang/String;IZZLcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Z)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "imageCount"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "hasCamera"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "hasVideo"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "cropIfSingle"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p0, "videoDefault"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    const-string p0, "from"

    .line 34
    .line 35
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 36
    .line 37
    .line 38
    const-string p0, "source"

    .line 39
    .line 40
    invoke-virtual {v0, p0, p6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 41
    .line 42
    .line 43
    const-string p0, "isFloatLayerExp"

    .line 44
    .line 45
    invoke-virtual {v0, p0, p8}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 46
    .line 47
    .line 48
    const-string p0, "gender"

    .line 49
    .line 50
    invoke-virtual {v0, p0, p9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    const-string p0, "title"

    .line 54
    .line 55
    invoke-virtual {v0, p0, p10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 56
    .line 57
    .line 58
    const-string p0, "cropNewProfilePicture"

    .line 59
    .line 60
    invoke-virtual {v0, p0, p11}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    const/4 p0, 0x1

    .line 64
    if-eq p1, p0, :cond_0

    .line 65
    .line 66
    if-nez p4, :cond_1

    .line 67
    .line 68
    :cond_0
    if-eqz p3, :cond_2

    .line 69
    .line 70
    sget p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 71
    .line 72
    if-eq p6, p0, :cond_1

    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 76
    .line 77
    .line 78
    const/4 p0, 0x0

    .line 79
    return-object p0

    .line 80
    :cond_2
    :goto_0
    return-object v0
.end method

.method public static l2(Landroid/content/Context;Ll/syx;)Landroid/content/Intent;
    .locals 2

    .line 1
    iget v0, p1, Ll/syx;->a:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    iget-boolean v0, p1, Ll/syx;->d:Z

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    :cond_0
    iget-boolean v0, p1, Ll/syx;->c:Z

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    iget v0, p1, Ll/syx;->f:I

    .line 15
    .line 16
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 17
    .line 18
    if-eq v0, v1, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    invoke-static {}, Ll/fig0;->a()V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_2
    :goto_0
    new-instance v0, Landroid/content/Intent;

    .line 27
    .line 28
    const-class v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;

    .line 29
    .line 30
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Ll/syx;->a()Landroid/os/Bundle;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {v0, p0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public static q2(Landroid/view/View;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;Ljava/util/List;Z)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroid/widget/TextView;",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_3

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-nez v3, :cond_1

    .line 19
    .line 20
    :cond_0
    move/from16 v3, p4

    .line 21
    .line 22
    goto/16 :goto_1

    .line 23
    .line 24
    :cond_1
    const/4 v3, 0x1

    .line 25
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/4 v3, 0x3

    .line 35
    const/high16 v4, 0x41600000    # 14.0f

    .line 36
    .line 37
    const/high16 v5, 0x41a00000    # 20.0f

    .line 38
    .line 39
    const-string v6, ""

    .line 40
    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    new-instance v7, Ll/pri0;

    .line 44
    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v9

    .line 68
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result v10

    .line 72
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 73
    .line 74
    .line 75
    move-result-object v11

    .line 76
    sget v13, Ll/pri0;->i:I

    .line 77
    .line 78
    const v14, -0x28b2c9

    .line 79
    .line 80
    .line 81
    const/4 v12, -0x1

    .line 82
    invoke-direct/range {v7 .. v14}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    new-instance v8, Ll/pri0;

    .line 87
    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    .line 94
    .line 95
    .line 96
    move-result v7

    .line 97
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v9

    .line 107
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result v10

    .line 111
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v11

    .line 115
    invoke-static {v3}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 116
    .line 117
    .line 118
    move-result-object v12

    .line 119
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 120
    .line 121
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    sget v3, Ll/c9c0;->O1:I

    .line 126
    .line 127
    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 128
    .line 129
    .line 130
    move-result v13

    .line 131
    sget v14, Ll/pri0;->i:I

    .line 132
    .line 133
    const/4 v15, -0x1

    .line 134
    invoke-direct/range {v8 .. v15}, Ll/pri0;-><init>(Ljava/lang/String;IILandroid/graphics/Typeface;III)V

    .line 135
    .line 136
    .line 137
    move-object v7, v8

    .line 138
    :goto_0
    invoke-virtual {v1, v7, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 139
    .line 140
    .line 141
    const/high16 v0, 0x41000000    # 8.0f

    .line 142
    .line 143
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setCompoundDrawablePadding(I)V

    .line 148
    .line 149
    .line 150
    return-void

    .line 151
    :goto_1
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/widget/TextView;->setCompoundDrawablesWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 155
    .line 156
    .line 157
    :cond_3
    return-void
.end method

.method public static r2(Lcom/p1/mobile/putong/data/Media;ZLjava/util/ArrayList;I)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Media;",
            "Z",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    return v0

    .line 8
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/4 v1, 0x0

    .line 13
    if-ne p3, p1, :cond_2

    .line 14
    .line 15
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget p0, Lcom/p1/mobile/putong/core/R$string;->si:I

    .line 20
    .line 21
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ki:I

    .line 26
    .line 27
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 28
    .line 29
    .line 30
    :goto_0
    return v1

    .line 31
    :cond_2
    instance-of p1, p0, Lcom/p1/mobile/putong/data/Video;

    .line 32
    .line 33
    if-eqz p1, :cond_3

    .line 34
    .line 35
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    sget p0, Lcom/p1/mobile/putong/core/R$string;->si:I

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 44
    .line 45
    .line 46
    return v1

    .line 47
    :cond_3
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-lez p1, :cond_4

    .line 52
    .line 53
    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 58
    .line 59
    if-eqz p1, :cond_4

    .line 60
    .line 61
    sget p0, Lcom/p1/mobile/putong/core/R$string;->si:I

    .line 62
    .line 63
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 64
    .line 65
    .line 66
    return v1

    .line 67
    :cond_4
    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    return v0
.end method


# virtual methods
.method public H()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public b(Ll/ewi;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/r0y;->E0(Ll/ewi;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uyh0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->m2(Ll/uyh0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public cropImage(Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ljava/lang/NullPointerException;

    .line 12
    .line 13
    const-string v1, "image path is null"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    const-string v1, "from_change_anchor_cover"

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x1

    .line 32
    invoke-static {v0, p1, v2, v1}, Lcom/p1/mobile/putong/core/newui/cropiwa/NewCropperAct;->J1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ZZ)Landroid/content/Intent;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/16 v0, 0x6000

    .line 37
    .line 38
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->cropImage(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->y:Landroid/view/View;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->x:Lv/VText;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    invoke-static {v0, v1, p0, v2, v3}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->q2(Landroid/view/View;Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;Ljava/util/List;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ll/r0y;->W0(Ljava/util/ArrayList;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 19
    .line 20
    invoke-virtual {p0}, Ll/r0y;->D0()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public i(Lcom/p1/mobile/putong/data/Media;Z)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 4
    .line 5
    invoke-static {p1, p2, v0, v1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->r2(Lcom/p1/mobile/putong/data/Media;ZLjava/util/ArrayList;I)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->f()V

    .line 10
    .line 11
    .line 12
    return p1
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/z0y;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/r0y;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/r0y;-><init>(Ll/ner;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 10
    .line 11
    new-instance v0, Ll/z0y;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/z0y;-><init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 19
    .line 20
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 24
    .line 25
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->i:Ll/qcj;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/r0y;->A0(Ll/qcj;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 31
    .line 32
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->j:Ll/qcj;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/r0y;->C0(Ll/qcj;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ll/r0y;->W0(Ljava/util/ArrayList;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/r0y;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j(Landroid/view/View;Lcom/p1/mobile/putong/data/Media;)V
    .locals 4

    .line 1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->r:I

    .line 2
    .line 3
    sget v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 4
    .line 5
    if-eq p1, v0, :cond_1

    .line 6
    .line 7
    new-instance p1, Ljava/io/File;

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    const-wide/16 v2, 0x0

    .line 29
    .line 30
    cmp-long p1, v0, v2

    .line 31
    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    :cond_0
    return-void

    .line 35
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    if-ne p1, v0, :cond_6

    .line 39
    .line 40
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->o:Z

    .line 41
    .line 42
    if-eqz p1, :cond_5

    .line 43
    .line 44
    instance-of p1, p2, Lcom/p1/mobile/putong/data/Video;

    .line 45
    .line 46
    if-nez p1, :cond_5

    .line 47
    .line 48
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->r:I

    .line 49
    .line 50
    sget v1, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 51
    .line 52
    if-ne p1, v1, :cond_2

    .line 53
    .line 54
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 55
    .line 56
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 57
    .line 58
    new-instance v0, Ll/myx;

    .line 59
    .line 60
    invoke-direct {v0, p0}, Ll/myx;-><init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, p2, v0}, Ll/am2;->i(Ljava/lang/String;Ll/y20;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-interface {p1}, Ll/bo;->a()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    const-string v1, "from_sign_up"

    .line 80
    .line 81
    if-eqz p1, :cond_3

    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_3

    .line 90
    .line 91
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 96
    .line 97
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->q:Z

    .line 104
    .line 105
    invoke-interface {p1, v0, p2, p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->openLoginUiOptCropAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_3
    invoke-static {}, Ll/h9n;->c()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_4

    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_4

    .line 122
    .line 123
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iget-object p0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 128
    .line 129
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 130
    .line 131
    invoke-static {p2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    invoke-interface {p1, p0, p2, v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->openLoginUiOptCropAct(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 136
    .line 137
    .line 138
    return-void

    .line 139
    :cond_4
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 140
    .line 141
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->cropImage(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_5
    invoke-static {p2}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    const/4 p2, 0x0

    .line 154
    const/4 v0, 0x0

    .line 155
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->u2(Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 160
    .line 161
    iget-object v0, p1, Ll/uyh0;->c:Ll/ewi;

    .line 162
    .line 163
    if-nez v0, :cond_7

    .line 164
    .line 165
    iget-object p1, p1, Ll/uyh0;->a:Ll/vg60;

    .line 166
    .line 167
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 168
    .line 169
    check-cast p1, Ljava/util/ArrayList;

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_7
    iget-object p1, v0, Ll/ewi;->c:Ll/vg60;

    .line 173
    .line 174
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 175
    .line 176
    check-cast p1, Ljava/util/ArrayList;

    .line 177
    .line 178
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    invoke-virtual {p0, p1, v0, p2}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->u2(Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public k()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public m2(Ll/uyh0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic n2(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/core/R$string;->s4:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->cropImage(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic o2(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    new-instance p1, Landroid/content/Intent;

    .line 10
    .line 11
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 12
    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    .line 1
    const/16 v0, 0x124

    .line 2
    .line 3
    if-ne p1, v0, :cond_5

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    if-ne p2, p1, :cond_4

    .line 7
    .line 8
    const-string p2, "selectedImages"

    .line 9
    .line 10
    invoke-virtual {p3, p2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    check-cast p2, Ljava/util/ArrayList;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 17
    .line 18
    const-string p2, "isDone"

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-virtual {p3, p2, v0}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-lez p2, :cond_0

    .line 34
    .line 35
    new-instance p2, Landroid/content/Intent;

    .line 36
    .line 37
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 38
    .line 39
    .line 40
    sget-object p3, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 43
    .line 44
    invoke-virtual {p2, p3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 59
    .line 60
    if-lez p1, :cond_2

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 63
    .line 64
    iget-object p1, p1, Ll/uyh0;->d:Ll/jic0;

    .line 65
    .line 66
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 67
    .line 68
    .line 69
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->n:Z

    .line 70
    .line 71
    if-eqz p1, :cond_3

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 74
    .line 75
    iget-object p1, p1, Ll/uyh0;->d:Ll/jic0;

    .line 76
    .line 77
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 78
    .line 79
    .line 80
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->f()V

    .line 81
    .line 82
    .line 83
    :cond_4
    return-void

    .line 84
    :cond_5
    invoke-super {p0, p1, p2, p3}, Lcom/p1/mobile/putong/app/PutongAct;->onActivityResult(IILandroid/content/Intent;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .line 1
    const-string v0, "force_select_image"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "signup_source"

    .line 30
    .line 31
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpData()Lcom/p1/mobile/putong/data/SignUpData;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SignUpData;->phoneNumber:Ljava/lang/String;

    .line 44
    .line 45
    const-string v2, "phone_num"

    .line 46
    .line 47
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v1, "e_picture_albums_back_button"

    .line 56
    .line 57
    const-string v2, "p_picture_albums_view"

    .line 58
    .line 59
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 60
    .line 61
    .line 62
    :cond_0
    invoke-super {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 63
    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-le v0, v1, :cond_1

    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getMenuInflater()Landroid/view/MenuInflater;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget v2, Ll/lfc0;->e:I

    .line 11
    .line 12
    invoke-virtual {v0, v2, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 13
    .line 14
    .line 15
    sget v0, Ll/adc0;->f3:I

    .line 16
    .line 17
    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->y:Landroid/view/View;

    .line 26
    .line 27
    sget v0, Ll/adc0;->p8:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lv/VText;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->x:Lv/VText;

    .line 36
    .line 37
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->x:Lv/VText;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreBusinessModule;->m0()Ll/eu9;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-interface {v2}, Ll/eu9;->c()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->y:Landroid/view/View;

    .line 67
    .line 68
    new-instance v0, Ll/kyx;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Ll/kyx;-><init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 74
    .line 75
    .line 76
    const p1, 0x1020002

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    new-instance v0, Ll/lyx;

    .line 84
    .line 85
    invoke-direct {v0, p0}, Ll/lyx;-><init>(Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;)V

    .line 86
    .line 87
    .line 88
    invoke-static {p1, v0}, Ll/bnl0;->b0(Landroid/view/View;Ll/pcj;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->pendChangeActionButtonTypeface()V

    .line 92
    .line 93
    .line 94
    return v1

    .line 95
    :cond_1
    const/4 p0, 0x0

    .line 96
    return p0
.end method

.method public onCropImageResult(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "preprocessed"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 13
    .line 14
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/kl40;->c()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const-string p1, "image/webp"

    .line 27
    .line 28
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const-string p1, "image/jpeg"

    .line 32
    .line 33
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 34
    .line 35
    :goto_0
    new-instance p1, Landroid/content/Intent;

    .line 36
    .line 37
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 38
    .line 39
    .line 40
    sget-object v1, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 41
    .line 42
    filled-new-array {v0}, [Lcom/p1/mobile/putong/data/Picture;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    const-string v0, "from"

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 58
    .line 59
    .line 60
    const/4 v0, -0x1

    .line 61
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onRecordVideoResult(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Video;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 11
    .line 12
    const-string p1, "raw"

    .line 13
    .line 14
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance p1, Landroid/content/Intent;

    .line 31
    .line 32
    invoke-direct {p1}, Landroid/content/Intent;-><init>()V

    .line 33
    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->h:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 40
    .line 41
    .line 42
    const/4 v0, -0x1

    .line 43
    invoke-virtual {p0, v0, p1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public onStartLifecycle()V
    .locals 3

    .line 1
    const-string v0, "p_picture_selection_view"

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    :try_start_0
    const-string v1, "signup_source"

    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->getSignUpType()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    :goto_0
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->onStartLifecycle()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onTakePictureResult(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->cropImage(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    new-instance v0, Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const-string p1, "raw"

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    new-array p1, p1, [Lcom/p1/mobile/putong/data/Media;

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    aput-object v0, p1, v1

    .line 33
    .line 34
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->u2(Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic p2()Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->f()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 5
    .line 6
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->n:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_media_albums_view"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const-string p0, "p_video_selection_view"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string p0, "p_picture_selection_view"

    .line 18
    .line 19
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "imageCount"

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "hasCamera"

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->m:Z

    .line 28
    .line 29
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "hasVideo"

    .line 34
    .line 35
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->n:Z

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v2, "cropIfSingle"

    .line 46
    .line 47
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->o:Z

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    const-string v2, "videoDefault"

    .line 58
    .line 59
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->p:Z

    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    const-string v2, "from"

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "source"

    .line 82
    .line 83
    sget v5, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->D:I

    .line 84
    .line 85
    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->r:I

    .line 90
    .line 91
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const-string v2, "isFloatLayerExp"

    .line 96
    .line 97
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 98
    .line 99
    .line 100
    move-result v1

    .line 101
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->v:Z

    .line 102
    .line 103
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v2, "gender"

    .line 108
    .line 109
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    check-cast v1, Lcom/p1/mobile/putong/data/Gender;

    .line 114
    .line 115
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->t:Lcom/p1/mobile/putong/data/Gender;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v2, "title"

    .line 122
    .line 123
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Ljava/lang/String;

    .line 128
    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->u:Ljava/lang/String;

    .line 130
    .line 131
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    const-string v2, "cropNewProfilePicture"

    .line 136
    .line 137
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->q:Z

    .line 142
    .line 143
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->r:I

    .line 144
    .line 145
    sget v2, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->C:I

    .line 146
    .line 147
    if-eq v1, v2, :cond_0

    .line 148
    .line 149
    invoke-super/range {p0 .. p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 150
    .line 151
    .line 152
    :cond_0
    iget v5, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 153
    .line 154
    if-lez v5, :cond_1

    .line 155
    .line 156
    iget-object v1, v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 157
    .line 158
    :goto_0
    move-object v15, v1

    .line 159
    goto :goto_1

    .line 160
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 161
    .line 162
    goto :goto_0

    .line 163
    :goto_1
    iput-object v15, v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 164
    .line 165
    iget-object v4, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 166
    .line 167
    iget-boolean v6, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->m:Z

    .line 168
    .line 169
    iget-boolean v7, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->n:Z

    .line 170
    .line 171
    iget-boolean v8, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->o:Z

    .line 172
    .line 173
    iget-boolean v9, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->p:Z

    .line 174
    .line 175
    iget v10, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->r:I

    .line 176
    .line 177
    iget-object v11, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 178
    .line 179
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->t:Lcom/p1/mobile/putong/data/Gender;

    .line 180
    .line 181
    iget-object v13, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->u:Ljava/lang/String;

    .line 182
    .line 183
    iget-boolean v14, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->v:Z

    .line 184
    .line 185
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->w:I

    .line 186
    .line 187
    move/from16 v16, v1

    .line 188
    .line 189
    invoke-virtual/range {v4 .. v16}, Ll/r0y;->F0(IZZZZILjava/lang/String;Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;ZLl/uyh0;I)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    const-string v2, "show_simple_avatar"

    .line 197
    .line 198
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    const-string v3, "tips_message"

    .line 207
    .line 208
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    iget-object v3, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->A:Ll/r0y;

    .line 213
    .line 214
    invoke-virtual {v3, v2}, Ll/r0y;->X0(Ljava/lang/String;)Ll/r0y;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {v2, v1}, Ll/r0y;->Y0(Z)Ll/r0y;

    .line 219
    .line 220
    .line 221
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 222
    .line 223
    iget-object v2, v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->c:Ll/uyh0;

    .line 224
    .line 225
    iget-object v3, v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->d:Ll/uyh0;

    .line 226
    .line 227
    iget-object v4, v0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->e:Ll/uyh0;

    .line 228
    .line 229
    invoke-virtual {v1, v2, v3, v4}, Ll/z0y;->T(Ll/uyh0;Ll/uyh0;Ll/uyh0;)V

    .line 230
    .line 231
    .line 232
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 233
    .line 234
    invoke-virtual {v1, v0}, Ll/z0y;->P(Ll/y20;)V

    .line 235
    .line 236
    .line 237
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-interface {v1}, Ll/bo;->a()Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-eqz v1, :cond_2

    .line 250
    .line 251
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 252
    .line 253
    const-string v2, "from_sign_up"

    .line 254
    .line 255
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    if-eqz v1, :cond_2

    .line 260
    .line 261
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->B:Ll/z0y;

    .line 262
    .line 263
    invoke-virtual {v1}, Ll/z0y;->R()V

    .line 264
    .line 265
    .line 266
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 267
    .line 268
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->pageId()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-virtual {v1, v0}, Ll/l4g0;->q(Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    return-void
.end method

.method public s2()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v0, v1}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->u2(Ljava/util/ArrayList;Ljava/util/ArrayList;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public shouldShowGradientActionBar()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/bo;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "from_sign_up"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldShowGradientActionBar()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public shouldShowGradientStatusBar()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->a()Ll/bo;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/bo;->a()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->s:Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "from_sign_up"

    .line 18
    .line 19
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return p0

    .line 27
    :cond_0
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->shouldShowGradientStatusBar()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0
.end method

.method public u2(Ljava/util/ArrayList;Ljava/util/ArrayList;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;I)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPickerAct;->l:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    :goto_0
    invoke-static {p0, p1, p2, p3, v0}, Lcom/p1/mobile/putong/core/ui/mediapicker/MediaPreviewAct;->Y1(Landroid/content/Context;Ljava/util/ArrayList;Ljava/util/ArrayList;II)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/16 p2, 0x124

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public x()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/mediapicker/MediaPickerBaseAct;->g:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/data/Media;I)V
    .locals 0

    .line 1
    return-void
.end method
