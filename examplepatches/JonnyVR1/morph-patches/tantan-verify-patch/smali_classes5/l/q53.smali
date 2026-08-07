.class public final synthetic Ll/q53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/w53;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/w53;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q53;->a:Ll/w53;

    iput-object p2, p0, Ll/q53;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q53;->a:Ll/w53;

    iget-object p0, p0, Ll/q53;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/w53;->g(Ll/w53;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
