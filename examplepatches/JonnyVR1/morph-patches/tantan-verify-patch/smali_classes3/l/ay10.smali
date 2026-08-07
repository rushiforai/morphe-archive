.class public final synthetic Ll/ay10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lrx/c$a;


# instance fields
.field public final synthetic a:Ll/by10;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/by10;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ay10;->a:Ll/by10;

    iput-object p2, p0, Ll/ay10;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ay10;->a:Ll/by10;

    iget-object p0, p0, Ll/ay10;->b:Lcom/p1/mobile/android/app/Act;

    check-cast p1, Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/by10;->c(Ll/by10;Lcom/p1/mobile/android/app/Act;Ll/gcg0;)V

    return-void
.end method
