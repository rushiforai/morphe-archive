.class public abstract Ll/ihw0;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public a:Ll/jhw0;

.field public final b:Ll/xgw0;


# direct methods
.method public constructor <init>(Ll/xgw0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ihw0;->b:Ll/xgw0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ihw0;->a:Ll/jhw0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/jhw0;->a(Ll/ihw0;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final b(Ll/jhw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ihw0;->a:Ll/jhw0;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ihw0;->a(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
