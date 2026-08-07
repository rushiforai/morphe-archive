.class public final synthetic Ll/juo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/hvo;


# direct methods
.method public synthetic constructor <init>(Ll/hvo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/juo;->a:Ll/hvo;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/juo;->a:Ll/hvo;

    invoke-static {p0}, Ll/hvo;->x(Ll/hvo;)Ljava/lang/Double;

    move-result-object p0

    return-object p0
.end method
