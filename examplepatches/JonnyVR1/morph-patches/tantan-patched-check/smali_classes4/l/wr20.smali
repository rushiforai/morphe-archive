.class public final synthetic Ll/wr20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/pf60;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/pf60;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wr20;->a:Ll/pf60;

    iput-object p2, p0, Ll/wr20;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wr20;->a:Ll/pf60;

    iget-object p0, p0, Ll/wr20;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, [I

    invoke-static {v0, p0, p1}, Ll/as20;->m(Ll/pf60;Lcom/p1/mobile/android/app/Act;[I)V

    return-void
.end method
