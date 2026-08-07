.class public final synthetic Ll/shw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s26;


# instance fields
.field public final synthetic a:Ll/lyr0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/lyr0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/shw0;->a:Ll/lyr0;

    .line 5
    .line 6
    iput p2, p0, Ll/shw0;->b:I

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final then(Lcom/google/android/gms/tasks/Task;)Ljava/lang/Object;
    .locals 1

    .line 1
    sget v0, Ll/vhw0;->e:I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->p()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Ll/shw0;->b:I

    .line 10
    .line 11
    iget-object p0, p0, Ll/shw0;->a:Ll/lyr0;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/xjw0;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/google/android/gms/internal/ads/c;

    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1, p0}, Ll/xjw0;->a([B)Ll/wjw0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, v0}, Ll/wjw0;->a(I)Ll/wjw0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/wjw0;->c()V

    .line 37
    .line 38
    .line 39
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 43
    .line 44
    return-object p0
.end method
