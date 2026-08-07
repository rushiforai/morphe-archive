.class public final synthetic Ll/hu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/App;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/App;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hu0;->a:Lcom/p1/mobile/android/app/App;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hu0;->a:Lcom/p1/mobile/android/app/App;

    invoke-static {p0}, Lcom/p1/mobile/android/app/App;->b(Lcom/p1/mobile/android/app/App;)V

    return-void
.end method
