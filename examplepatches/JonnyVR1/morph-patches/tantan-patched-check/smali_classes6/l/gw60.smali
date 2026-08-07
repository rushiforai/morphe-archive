.class public final synthetic Ll/gw60;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gw60;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/gw60;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/gw60;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/gw60;->b:Ll/x20;

    invoke-static {v0, p0}, Ll/vw60;->j(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    return-void
.end method
