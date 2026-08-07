.class public Lcom/android/billingclient/api/c$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/billingclient/api/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/billingclient/api/c$c$a;
    }
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:I


# direct methods
.method public synthetic constructor <init>(Ll/idt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Lcom/android/billingclient/api/c$c;->c:I

    .line 6
    .line 7
    return-void
.end method

.method public static a()Lcom/android/billingclient/api/c$c$a;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/android/billingclient/api/c$c$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/android/billingclient/api/c$c$a;-><init>(Ll/idt0;)V

    return-object v0
.end method

.method public static bridge synthetic c(Lcom/android/billingclient/api/c$c;)Lcom/android/billingclient/api/c$c$a;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/billingclient/api/c$c;->a()Lcom/android/billingclient/api/c$c$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/android/billingclient/api/c$c;->a:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/c$c$a;->f(Ljava/lang/String;)Lcom/android/billingclient/api/c$c$a;

    .line 8
    .line 9
    .line 10
    iget v1, p0, Lcom/android/billingclient/api/c$c;->c:I

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/android/billingclient/api/c$c$a;->d(I)Lcom/android/billingclient/api/c$c$a;

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/billingclient/api/c$c;->b:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Lcom/android/billingclient/api/c$c$a;->c(Ljava/lang/String;)Lcom/android/billingclient/api/c$c$a;

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public static bridge synthetic f(Lcom/android/billingclient/api/c$c;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/billingclient/api/c$c;->a:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic g(Lcom/android/billingclient/api/c$c;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/billingclient/api/c$c;->b:Ljava/lang/String;

    return-void
.end method

.method public static bridge synthetic h(Lcom/android/billingclient/api/c$c;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/billingclient/api/c$c;->c:I

    return-void
.end method


# virtual methods
.method public final b()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/billingclient/api/c$c;->c:I

    return p0
.end method

.method public final d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/c$c;->a:Ljava/lang/String;

    return-object p0
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/billingclient/api/c$c;->b:Ljava/lang/String;

    return-object p0
.end method
