.class public final Lqoj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljnf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lgjm;

.field public final c:Lwt3;

.field public final d:Lwt3;

.field public final e:Lwt3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lnd3;Lgjm;Lwt3;Lwt3;Lwt3;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqoj;->a:Lcom/opera/android/BrowserActivity;

    iput-object p3, p0, Lqoj;->b:Lgjm;

    iput-object p4, p0, Lqoj;->c:Lwt3;

    iput-object p5, p0, Lqoj;->d:Lwt3;

    iput-object p6, p0, Lqoj;->e:Lwt3;

    return-void
.end method


# virtual methods
.method public final a(ILlag;)V
    .registers 6

    new-instance v0, Luoj;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Ls9g;->h:Ls9g;

    iget-object v2, p0, Lqoj;->b:Lgjm;

    invoke-direct {v0, v1, v2, p1, p2}, Luoj;-><init>(Ls9g;Lgjm;ILlag;)V

    const/16 p1, 0x1003

    invoke-static {v0, p1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lqoj;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method
