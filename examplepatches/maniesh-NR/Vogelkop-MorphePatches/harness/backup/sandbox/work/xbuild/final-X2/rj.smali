.class public final Lrj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljnf;


# instance fields
.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lgjm;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lgjm;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrj;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lrj;->b:Lgjm;

    return-void
.end method


# virtual methods
.method public final varargs a([I)V
    .registers 6

    new-instance v0, Lqk;

    new-instance v1, Loba;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3, p1}, Loba;-><init>(II[I)V

    invoke-direct {v0, v1}, Lqk;-><init>(Loba;)V

    iget-object p0, p0, Lrj;->b:Lgjm;

    invoke-virtual {p0, v0, v3}, Lgjm;->e(Ln37;Z)V

    return-void
.end method
