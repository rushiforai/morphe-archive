.class public final synthetic Ll/ad20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/bd20;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/bd20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ad20;->a:Ll/bd20;

    iput-object p2, p0, Ll/ad20;->b:Lcom/p1/mobile/android/app/Act;

    iput-object p3, p0, Ll/ad20;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ad20;->a:Ll/bd20;

    iget-object v1, p0, Ll/ad20;->b:Lcom/p1/mobile/android/app/Act;

    iget-object p0, p0, Ll/ad20;->c:Ljava/lang/String;

    invoke-static {v0, v1, p0}, Ll/bd20;->f0(Ll/bd20;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    return-void
.end method
