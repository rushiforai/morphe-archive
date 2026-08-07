.class public final synthetic Ll/i2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/r1m;


# instance fields
.field public final synthetic a:Ll/l2;


# direct methods
.method public synthetic constructor <init>(Ll/l2;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2;->a:Ll/l2;

    return-void
.end method


# virtual methods
.method public final onSuccess(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2;->a:Ll/l2;

    invoke-static {p0, p1}, Ll/l2;->x(Ll/l2;Ljava/lang/String;)V

    return-void
.end method
