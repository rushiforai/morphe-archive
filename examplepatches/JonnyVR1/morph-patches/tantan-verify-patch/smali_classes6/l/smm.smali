.class public final synthetic Ll/smm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ymm;


# direct methods
.method public synthetic constructor <init>(Ll/ymm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/smm;->a:Ll/ymm;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/smm;->a:Ll/ymm;

    check-cast p1, Ll/bkj0;

    invoke-static {p0, p1}, Ll/ymm;->I(Ll/ymm;Ll/bkj0;)V

    return-void
.end method
