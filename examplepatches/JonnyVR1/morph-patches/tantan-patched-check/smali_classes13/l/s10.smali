.class public final synthetic Ll/s10;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/s10;->a:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s10;->a:Lcom/p1/mobile/android/app/Act;

    invoke-static {p0}, Lcom/p1/mobile/android/app/Act;->P0(Lcom/p1/mobile/android/app/Act;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
