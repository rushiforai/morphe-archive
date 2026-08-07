.class public final synthetic Ll/q6d0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lcom/p1/mobile/android/app/Act;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/q6d0;->a:Ljava/lang/String;

    iput-object p2, p0, Ll/q6d0;->b:Lcom/p1/mobile/android/app/Act;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q6d0;->a:Ljava/lang/String;

    iget-object p0, p0, Ll/q6d0;->b:Lcom/p1/mobile/android/app/Act;

    invoke-static {v0, p0}, Ll/x6d0;->c0(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method
