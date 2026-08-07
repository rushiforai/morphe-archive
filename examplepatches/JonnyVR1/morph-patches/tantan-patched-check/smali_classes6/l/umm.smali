.class public final synthetic Ll/umm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/fmm;


# direct methods
.method public synthetic constructor <init>(Ll/fmm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/umm;->a:Ll/fmm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/umm;->a:Ll/fmm;

    check-cast p1, Ljava/util/Map;

    invoke-static {p0, p1}, Ll/ymm;->C(Ll/fmm;Ljava/util/Map;)V

    return-void
.end method
