.class public final synthetic Ll/ow20;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ww20;


# direct methods
.method public synthetic constructor <init>(Ll/ww20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ow20;->a:Ll/ww20;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ow20;->a:Ll/ww20;

    invoke-static {p0}, Ll/ww20;->m(Ll/ww20;)V

    return-void
.end method
