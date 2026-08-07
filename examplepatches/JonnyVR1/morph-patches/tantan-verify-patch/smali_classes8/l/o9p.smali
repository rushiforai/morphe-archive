.class public final synthetic Ll/o9p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r9p;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/r9p;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/o9p;->a:Ll/r9p;

    iput-object p2, p0, Ll/o9p;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/o9p;->a:Ll/r9p;

    iget-object p0, p0, Ll/o9p;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/r9p;->a(Ll/r9p;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
