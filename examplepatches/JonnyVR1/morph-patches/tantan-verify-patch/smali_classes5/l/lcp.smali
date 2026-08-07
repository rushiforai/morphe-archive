.class public final synthetic Ll/lcp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/ncp;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/ncp;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lcp;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/lcp;->b:Ll/ncp;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/lcp;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/lcp;->b:Ll/ncp;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/ncp;->e0(Lcom/p1/mobile/android/app/Act;Ll/ncp;Ll/uxj0;)V

    return-void
.end method
