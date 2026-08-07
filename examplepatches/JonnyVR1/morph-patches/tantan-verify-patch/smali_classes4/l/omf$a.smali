.class public Ll/omf$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e3i0$e;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/omf;->y(Ll/e3i0;Landroid/content/Context;Landroid/widget/FrameLayout;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:I

.field public final synthetic d:Ll/omf;


# direct methods
.method public constructor <init>(Ll/omf;Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;Landroid/content/Context;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/omf$a;->d:Ll/omf;

    .line 2
    .line 3
    iput-object p2, p0, Ll/omf$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 4
    .line 5
    iput-object p3, p0, Ll/omf$a;->b:Landroid/content/Context;

    .line 6
    .line 7
    iput p4, p0, Ll/omf$a;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;ILandroid/view/ViewGroup;)V
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p2, p0, Ll/omf$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->createEmptyHolder()Ll/f6l;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2, p1}, Ll/dmf;->j(Landroid/view/View;)Z

    .line 8
    .line 9
    .line 10
    move-result p3

    .line 11
    if-nez p3, :cond_0

    .line 12
    .line 13
    new-instance p1, Ljava/lang/RuntimeException;

    .line 14
    .line 15
    new-instance p2, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    const-string p3, "\u5f02\u6b65\u52a0\u8f7d\u5e03\u5c40\u7684\u7c7b\u578b\u4e0d\u4e00\u81f4\uff1a"

    .line 18
    .line 19
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/omf$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getAlias()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    invoke-virtual {p2, p1}, Ll/dmf;->i(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    iget-object p2, p0, Ll/omf$a;->b:Landroid/content/Context;

    .line 46
    .line 47
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    sget-object p3, Lcom/p1/mobile/android/app/c;->m:Lcom/p1/mobile/android/app/c;

    .line 54
    .line 55
    if-eq p2, p3, :cond_2

    .line 56
    .line 57
    iget-object p2, p0, Ll/omf$a;->b:Landroid/content/Context;

    .line 58
    .line 59
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 60
    .line 61
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    sget-object p3, Lcom/p1/mobile/android/app/c;->o:Lcom/p1/mobile/android/app/c;

    .line 66
    .line 67
    if-eq p2, p3, :cond_2

    .line 68
    .line 69
    iget-object p2, p0, Ll/omf$a;->b:Landroid/content/Context;

    .line 70
    .line 71
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    if-nez p2, :cond_2

    .line 78
    .line 79
    iget-object p2, p0, Ll/omf$a;->b:Landroid/content/Context;

    .line 80
    .line 81
    check-cast p2, Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    invoke-virtual {p2}, Landroid/app/Activity;->isDestroyed()Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    invoke-static {}, Ll/rof;->d()Ll/rof;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    iget-object p3, p0, Ll/omf$a;->b:Landroid/content/Context;

    .line 95
    .line 96
    check-cast p3, Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    invoke-virtual {p2, p3}, Ll/rof;->c(Lcom/p1/mobile/android/app/Act;)Ll/knf;

    .line 99
    .line 100
    .line 101
    move-result-object p2

    .line 102
    iget-object p3, p0, Ll/omf$a;->a:Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;

    .line 103
    .line 104
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/holder/HomeCardExpandedType;->getType()I

    .line 105
    .line 106
    .line 107
    move-result p3

    .line 108
    invoke-virtual {p2, p3, p1}, Ll/knf;->b(ILandroid/view/View;)V

    .line 109
    .line 110
    .line 111
    iget-object p1, p0, Ll/omf$a;->d:Ll/omf;

    .line 112
    .line 113
    invoke-static {p1}, Ll/omf;->o(Ll/omf;)I

    .line 114
    .line 115
    .line 116
    move-result p2

    .line 117
    add-int/lit8 p2, p2, 0x1

    .line 118
    .line 119
    invoke-static {p1, p2}, Ll/omf;->p(Ll/omf;I)V

    .line 120
    .line 121
    .line 122
    iget-object p1, p0, Ll/omf$a;->d:Ll/omf;

    .line 123
    .line 124
    invoke-static {p1}, Ll/omf;->o(Ll/omf;)I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iget p2, p0, Ll/omf$a;->c:I

    .line 129
    .line 130
    if-ne p1, p2, :cond_2

    .line 131
    .line 132
    iget-object p0, p0, Ll/omf$a;->d:Ll/omf;

    .line 133
    .line 134
    iget-object p0, p0, Ll/omf;->b:Lrx/subjects/a;

    .line 135
    .line 136
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    check-cast p1, Ljava/lang/Integer;

    .line 141
    .line 142
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result p1

    .line 146
    add-int/lit8 p1, p1, 0x1

    .line 147
    .line 148
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    :cond_2
    :goto_0
    return-void
.end method
