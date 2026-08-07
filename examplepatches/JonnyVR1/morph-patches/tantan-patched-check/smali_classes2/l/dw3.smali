.class public final synthetic Ll/dw3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hm50;


# instance fields
.field public final synthetic a:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dw3;->a:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dw3;->a:Ljava/lang/String;

    check-cast p1, Ljava/lang/Exception;

    invoke-static {p0, p1}, Ll/ew3;->b(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method
