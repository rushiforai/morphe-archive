.class Lcom/idv/identity/platform/FinalVerifyActivity$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/idv/identity/platform/FinalVerifyActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/idv/identity/platform/FinalVerifyActivity;


# direct methods
.method public constructor <init>(Lcom/idv/identity/platform/FinalVerifyActivity;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/idv/identity/platform/FinalVerifyActivity$d;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$d;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/FinalVerifyActivity;->W0(Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/afm;->i0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$d;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 18
    .line 19
    sget-object v0, Ll/dfm;->E:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0, v0}, Lcom/idv/identity/platform/FinalVerifyActivity;->P0(Lcom/idv/identity/platform/FinalVerifyActivity;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v1, Ll/ffm;->g:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_2

    .line 32
    .line 33
    sget-object v1, Ll/ffm;->d:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return-void

    .line 43
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/idv/identity/platform/FinalVerifyActivity$d;->a:Lcom/idv/identity/platform/FinalVerifyActivity;

    .line 44
    .line 45
    sget-object v0, Ll/dfm;->r:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p0, v0}, Lcom/idv/identity/platform/FinalVerifyActivity;->P0(Lcom/idv/identity/platform/FinalVerifyActivity;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
