.class public Ll/tx0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/RatingBar$OnRatingBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/tx0;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/jl80;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/tx0$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Ll/tx0$a;->b:Ll/jl80;

    .line 4
    .line 5
    iput-object p3, p0, Ll/tx0$a;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(FLl/jl80;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 1

    .line 1
    const v0, 0x40466666    # 3.1f

    .line 2
    .line 3
    .line 4
    cmpg-float v0, p0, v0

    .line 5
    .line 6
    if-gez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    invoke-static {p2, p0}, Ll/tx0;->l(Lcom/p1/mobile/android/app/Act;F)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Ll/tx0;->e:Ll/jxd0;

    .line 19
    .line 20
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x1

    .line 30
    invoke-static {p2, p1, p0, p3}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public onRatingChanged(Landroid/widget/RatingBar;FZ)V
    .locals 1

    .line 1
    if-eqz p3, :cond_0

    .line 2
    .line 3
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p1, p1, Ll/tx0;->f:Ll/jxd0;

    .line 8
    .line 9
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p1, p3}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    new-instance p1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string p3, ""

    .line 23
    .line 24
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const-string p3, "inapp_rating_star_num"

    .line 32
    .line 33
    invoke-static {p3, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    const-string p3, "e_inapp_rating_star_selector"

    .line 42
    .line 43
    const-string v0, "p_appstore_rating_filter_popup"

    .line 44
    .line 45
    invoke-static {p3, v0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/tx0$a;->a:Lcom/p1/mobile/android/app/Act;

    .line 49
    .line 50
    iget-object p3, p0, Ll/tx0$a;->b:Ll/jl80;

    .line 51
    .line 52
    iget-object p0, p0, Ll/tx0$a;->c:Ljava/lang/String;

    .line 53
    .line 54
    new-instance v0, Ll/sx0;

    .line 55
    .line 56
    invoke-direct {v0, p2, p3, p1, p0}, Ll/sx0;-><init>(FLl/jl80;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    const-wide/16 p2, 0x12c

    .line 60
    .line 61
    invoke-static {p1, v0, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method
