.class public final synthetic Ll/jdi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pdi;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ll/pdi;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/jdi;->a:Ll/pdi;

    iput-object p2, p0, Ll/jdi;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/jdi;->a:Ll/pdi;

    iget-object p0, p0, Ll/jdi;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/pdi;->b(Ll/pdi;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
