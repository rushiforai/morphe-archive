.class public final synthetic Ll/bxu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/jxu;


# direct methods
.method public synthetic constructor <init>(Ll/jxu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bxu;->a:Ll/jxu;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bxu;->a:Ll/jxu;

    check-cast p1, Ljava/lang/String;

    invoke-static {p0, p1}, Ll/jxu;->V2(Ll/jxu;Ljava/lang/String;)V

    return-void
.end method
