.class public Ll/jdq0$c$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/jdq0$c;->onAnimationEnd(Landroid/animation/Animator;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/jdq0$c;


# direct methods
.method public constructor <init>(Ll/jdq0$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/jdq0$c$a;->a:Ll/jdq0$c;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/jdq0$c$a;->a:Ll/jdq0$c;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jdq0$c;->b:Ll/jdq0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jdq0;->M(Ll/jdq0;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    new-instance v3, Ljava/util/Random;

    .line 10
    .line 11
    invoke-direct {v3}, Ljava/util/Random;-><init>()V

    .line 12
    .line 13
    .line 14
    const/16 v4, 0x1e

    .line 15
    .line 16
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    add-int/lit8 v3, v3, 0x5a

    .line 21
    .line 22
    int-to-long v3, v3

    .line 23
    add-long/2addr v1, v3

    .line 24
    invoke-static {v0, v1, v2}, Ll/jdq0;->P(Ll/jdq0;J)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/jdq0$c$a;->a:Ll/jdq0$c;

    .line 28
    .line 29
    iget-object v0, v0, Ll/jdq0$c;->b:Ll/jdq0;

    .line 30
    .line 31
    iget-object v1, v0, Ll/jdq0;->j:Lv/VText_AutoFit;

    .line 32
    .line 33
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v2, Lcom/p1/mobile/putong/account/R$string;->q0:I

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v2, p0, Ll/jdq0$c$a;->a:Ll/jdq0$c;

    .line 48
    .line 49
    iget-object v2, v2, Ll/jdq0$c;->b:Ll/jdq0;

    .line 50
    .line 51
    invoke-static {v2}, Ll/jdq0;->M(Ll/jdq0;)J

    .line 52
    .line 53
    .line 54
    move-result-wide v2

    .line 55
    invoke-static {v2, v3}, Ll/jdq0;->V(J)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/jdq0$c$a;->a:Ll/jdq0$c;

    .line 71
    .line 72
    iget-object v0, v0, Ll/jdq0$c;->b:Ll/jdq0;

    .line 73
    .line 74
    invoke-static {v0}, Ll/jdq0;->S(Ll/jdq0;)V

    .line 75
    .line 76
    .line 77
    iget-object v0, p0, Ll/jdq0$c$a;->a:Ll/jdq0$c;

    .line 78
    .line 79
    iget-object v0, v0, Ll/jdq0$c;->b:Ll/jdq0;

    .line 80
    .line 81
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-wide/16 v1, 0x3e8

    .line 86
    .line 87
    invoke-static {v0, p0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 88
    .line 89
    .line 90
    return-void
.end method
