.class public final synthetic Ll/t0k0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/io/File;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t0k0;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/t0k0;->b:Ljava/io/File;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/t0k0;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/t0k0;->b:Ljava/io/File;

    invoke-static {v0, p0}, Ll/d1k0;->f(Lcom/p1/mobile/android/app/Act;Ljava/io/File;)V

    return-void
.end method
