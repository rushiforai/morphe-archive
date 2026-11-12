.class public final Lcom/opera/android/suggestion/adapter/SuggestionListItem;
.super Lcom/opera/android/ui/catalog/widget/OperaListItem;
.source "SourceFile"

# interfaces
.implements Lpvb;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/suggestion/adapter/SuggestionListItem;",
        "Lcom/opera/android/ui/catalog/widget/OperaListItem;",
        "Lpvb;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final E:[I


# instance fields
.field public D:Lcom/opera/android/suggestion/Suggestion;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const v0, 0x101009c

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->E:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 2

    and-int/lit8 p1, p1, -0x5

    invoke-super {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->G(I)V

    return-void
.end method

.method public final a()Z
    .registers 4

    iget-object v0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v0, :cond_b

    iget v0, v0, Lcom/opera/android/suggestion/Suggestion;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    if-eqz v0, :cond_16

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    const/16 v2, 0xb

    if-eq v1, v2, :cond_25

    :cond_16
    if-eqz v0, :cond_20

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x1a

    if-eq v0, v1, :cond_25

    :cond_20
    invoke-super {p0}, Lpvb;->a()Z

    move-result p0

    return p0

    :cond_25
    const/4 p0, 0x1

    return p0
.end method

.method public final c()Ljava/lang/String;
    .registers 5

    iget-object v0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget v0, v0, Lcom/opera/android/suggestion/Suggestion;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eqz v2, :cond_12c

    :cond_15
    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_12c

    :cond_1e
    if-eqz v0, :cond_27

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_12c

    :cond_27
    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_12c

    :cond_30
    if-eqz v0, :cond_39

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_12c

    :cond_39
    if-eqz v0, :cond_42

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x5

    if-eq v2, v3, :cond_12c

    :cond_42
    if-eqz v0, :cond_4b

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x6

    if-eq v2, v3, :cond_12c

    :cond_4b
    if-eqz v0, :cond_54

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_12c

    :cond_54
    if-eqz v0, :cond_5e

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_12c

    :cond_5e
    if-eqz v0, :cond_68

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x9

    if-eq v2, v3, :cond_12c

    :cond_68
    if-eqz v0, :cond_72

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xa

    if-eq v2, v3, :cond_12c

    :cond_72
    if-eqz v0, :cond_7c

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xb

    if-eq v2, v3, :cond_12c

    :cond_7c
    if-eqz v0, :cond_86

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xc

    if-eq v2, v3, :cond_12c

    :cond_86
    if-eqz v0, :cond_90

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xd

    if-eq v2, v3, :cond_12c

    :cond_90
    if-eqz v0, :cond_9a

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xe

    if-eq v2, v3, :cond_12c

    :cond_9a
    if-eqz v0, :cond_a4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xf

    if-eq v2, v3, :cond_12c

    :cond_a4
    if-eqz v0, :cond_ae

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x12

    if-eq v2, v3, :cond_12c

    :cond_ae
    if-eqz v0, :cond_b8

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x13

    if-eq v2, v3, :cond_12c

    :cond_b8
    if-eqz v0, :cond_c2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x17

    if-eq v2, v3, :cond_12c

    :cond_c2
    if-eqz v0, :cond_cc

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x18

    if-eq v2, v3, :cond_12c

    :cond_cc
    if-eqz v0, :cond_d6

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x10

    if-eq v2, v3, :cond_125

    :cond_d6
    if-eqz v0, :cond_e0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x22

    if-eq v2, v3, :cond_125

    :cond_e0
    if-eqz v0, :cond_ea

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x11

    if-eq v2, v3, :cond_125

    :cond_ea
    if-eqz v0, :cond_f4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x21

    if-eq v2, v3, :cond_125

    :cond_f4
    if-eqz v0, :cond_fe

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x15

    if-eq v2, v3, :cond_125

    :cond_fe
    if-eqz v0, :cond_108

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x16

    if-eq v2, v3, :cond_125

    :cond_108
    if-eqz v0, :cond_112

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x19

    if-eq v2, v3, :cond_125

    :cond_112
    if-eqz v0, :cond_11c

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x1a

    if-eq v0, v2, :cond_125

    :cond_11c
    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_134

    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->a()Ljava/lang/String;

    move-result-object v1

    goto :goto_134

    :cond_125
    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_134

    iget-object v1, p0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    goto :goto_134

    :cond_12c
    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_134

    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->a()Ljava/lang/String;

    move-result-object v1

    :cond_134
    :goto_134
    if-nez v1, :cond_139

    const-string p0, ""

    return-object p0

    :cond_139
    return-object v1
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    return-object p0
.end method

.method public final j()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final m()Li1;
    .registers 5

    iget-object v0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget v0, v0, Lcom/opera/android/suggestion/Suggestion;->a:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-eqz v2, :cond_148

    :cond_15
    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x1

    if-eq v2, v3, :cond_148

    :cond_1e
    if-eqz v0, :cond_27

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_148

    :cond_27
    if-eqz v0, :cond_30

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_148

    :cond_30
    if-eqz v0, :cond_39

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_148

    :cond_39
    if-eqz v0, :cond_42

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x5

    if-eq v2, v3, :cond_148

    :cond_42
    if-eqz v0, :cond_4b

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x6

    if-eq v2, v3, :cond_148

    :cond_4b
    if-eqz v0, :cond_54

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_148

    :cond_54
    if-eqz v0, :cond_5e

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_148

    :cond_5e
    if-eqz v0, :cond_68

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x9

    if-eq v2, v3, :cond_148

    :cond_68
    if-eqz v0, :cond_72

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xa

    if-eq v2, v3, :cond_148

    :cond_72
    if-eqz v0, :cond_7c

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xb

    if-eq v2, v3, :cond_148

    :cond_7c
    if-eqz v0, :cond_86

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xc

    if-eq v2, v3, :cond_148

    :cond_86
    if-eqz v0, :cond_90

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xd

    if-eq v2, v3, :cond_148

    :cond_90
    if-eqz v0, :cond_9a

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xe

    if-eq v2, v3, :cond_148

    :cond_9a
    if-eqz v0, :cond_a4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xf

    if-eq v2, v3, :cond_148

    :cond_a4
    if-eqz v0, :cond_ae

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x17

    if-eq v2, v3, :cond_148

    :cond_ae
    if-eqz v0, :cond_b8

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x18

    if-eq v2, v3, :cond_148

    :cond_b8
    if-eqz v0, :cond_c2

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x1a

    if-eq v2, v3, :cond_148

    :cond_c2
    if-eqz v0, :cond_cc

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x10

    if-eq v2, v3, :cond_fe

    :cond_cc
    if-eqz v0, :cond_d6

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x22

    if-eq v2, v3, :cond_fe

    :cond_d6
    if-eqz v0, :cond_e0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x11

    if-eq v2, v3, :cond_fe

    :cond_e0
    if-eqz v0, :cond_ea

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x21

    if-eq v2, v3, :cond_fe

    :cond_ea
    if-eqz v0, :cond_f4

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0x15

    if-eq v2, v3, :cond_fe

    :cond_f4
    if-eqz v0, :cond_162

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x16

    if-ne v0, v2, :cond_162

    :cond_fe
    iget-object v0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v0, :cond_107

    invoke-virtual {v0}, Lcom/opera/android/suggestion/Suggestion;->a()Ljava/lang/String;

    move-result-object v0

    goto :goto_108

    :cond_107
    move-object v0, v1

    :goto_108
    iget-object v2, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v2, :cond_10f

    iget-object v2, v2, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    goto :goto_110

    :cond_10f
    move-object v2, v1

    :goto_110
    if-eqz v0, :cond_12e

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_12e

    if-eqz v2, :cond_12e

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_12e

    new-instance v1, Li1;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lnr8;->e(Landroid/content/Context;)I

    move-result p0

    invoke-direct {v1, v2, v0, p0}, Li1;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :cond_12e
    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_13b

    invoke-static {p0}, Lybh;->g(Lcom/opera/android/suggestion/Suggestion;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_13c

    :cond_13b
    move-object p0, v1

    :goto_13c
    if-eqz p0, :cond_162

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    new-instance v0, Li1;

    invoke-direct {v0, p0}, Li1;-><init>(I)V

    return-object v0

    :cond_148
    iget-object p0, p0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    if-eqz p0, :cond_155

    invoke-static {p0}, Lybh;->g(Lcom/opera/android/suggestion/Suggestion;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    goto :goto_156

    :cond_155
    move-object p0, v1

    :goto_156
    if-eqz p0, :cond_162

    invoke-virtual {p0}, Ljava/lang/Number;->intValue()I

    move-result p0

    new-instance v0, Li1;

    invoke-direct {v0, p0}, Li1;-><init>(I)V

    return-object v0

    :cond_162
    return-object v1
.end method

.method public final onCreateDrawableState(I)[I
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    move-result v0

    if-eqz v0, :cond_13

    add-int/lit8 p1, p1, 0x1

    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    sget-object p1, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->E:[I

    invoke-static {p0, p1}, Landroid/view/View;->mergeDrawableStates([I[I)[I

    move-result-object p0

    return-object p0

    :cond_13
    invoke-super {p0, p1}, Landroid/view/View;->onCreateDrawableState(I)[I

    move-result-object p0

    return-object p0
.end method
