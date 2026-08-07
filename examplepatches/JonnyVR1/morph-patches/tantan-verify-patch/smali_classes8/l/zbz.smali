.class public final synthetic Ll/zbz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zbz;->a:Lcom/p1/mobile/android/app/Act;

    iput-object p2, p0, Ll/zbz;->b:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zbz;->a:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/zbz;->b:Ljava/lang/Runnable;

    invoke-static {v0, p0}, Ll/tcz;->n(Lcom/p1/mobile/android/app/Act;Ljava/lang/Runnable;)V

    return-void
.end method
