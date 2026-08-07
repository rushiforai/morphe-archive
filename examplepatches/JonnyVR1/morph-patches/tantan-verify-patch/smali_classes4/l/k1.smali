.class public final synthetic Ll/k1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/surveysparrow/ss_android_sdk/a$a;


# direct methods
.method public synthetic constructor <init>(Lcom/surveysparrow/ss_android_sdk/a$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k1;->a:Lcom/surveysparrow/ss_android_sdk/a$a;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k1;->a:Lcom/surveysparrow/ss_android_sdk/a$a;

    check-cast p1, Ljava/lang/String;

    invoke-interface {p0, p1}, Lcom/surveysparrow/ss_android_sdk/a$a;->onResponse(Ljava/lang/String;)V

    return-void
.end method
