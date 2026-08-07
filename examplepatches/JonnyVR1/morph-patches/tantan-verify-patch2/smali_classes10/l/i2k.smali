.class public final synthetic Ll/i2k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/k2k;


# direct methods
.method public synthetic constructor <init>(Ll/k2k;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i2k;->a:Ll/k2k;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i2k;->a:Ll/k2k;

    check-cast p1, Ljava/util/List;

    invoke-static {p0, p1}, Ll/k2k;->W3(Ll/k2k;Ljava/util/List;)V

    return-void
.end method
