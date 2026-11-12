.class public final Lben;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljnf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lgjm;

.field public final c:Lwt3;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;Lwt3;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lben;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lben;->b:Lgjm;

    iput-object p3, p0, Lben;->c:Lwt3;

    return-void
.end method


# virtual methods
.method public final varargs a([I)V
    .registers 6

    new-instance v0, Lvfn;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    const/4 p1, 0x1

    invoke-direct {v0, v3, v1, p1}, Lvfn;-><init>(ILoba;I)V

    iget-object p0, p0, Lben;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method
