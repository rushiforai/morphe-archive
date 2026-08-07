.class public final synthetic Ll/hdi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hdi;->a:Lcom/p1/mobile/android/app/Act;

    iput-boolean p2, p0, Ll/hdi;->b:Z

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hdi;->a:Lcom/p1/mobile/android/app/Act;

    iget-boolean p0, p0, Ll/hdi;->b:Z

    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-static {v0, p0, p1}, Ll/pdi;->r(Lcom/p1/mobile/android/app/Act;ZLcom/p1/mobile/putong/data/User;)V

    return-void
.end method
