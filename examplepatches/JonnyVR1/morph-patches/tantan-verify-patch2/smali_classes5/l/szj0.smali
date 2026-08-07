.class public final synthetic Ll/szj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/p0k0;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ll/p0k0$b;

.field public final synthetic d:Lrx/subjects/a;


# direct methods
.method public synthetic constructor <init>(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$b;Lrx/subjects/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/szj0;->a:Ll/p0k0;

    iput-object p2, p0, Ll/szj0;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/szj0;->c:Ll/p0k0$b;

    iput-object p4, p0, Ll/szj0;->d:Lrx/subjects/a;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/szj0;->a:Ll/p0k0;

    iget-object v1, p0, Ll/szj0;->b:Lcom/p1/mobile/android/app/Act;

    iget-object v2, p0, Ll/szj0;->c:Ll/p0k0$b;

    iget-object p0, p0, Ll/szj0;->d:Lrx/subjects/a;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, v1, v2, p0, p1}, Ll/p0k0;->P(Ll/p0k0;Lcom/p1/mobile/android/app/Act;Ll/p0k0$b;Lrx/subjects/a;Ll/gcg0;)V

    return-void
.end method
