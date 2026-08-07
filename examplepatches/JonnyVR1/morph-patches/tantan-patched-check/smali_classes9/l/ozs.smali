.class public final synthetic Ll/ozs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/pzs;


# direct methods
.method public synthetic constructor <init>(Ll/pzs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ozs;->a:Ll/pzs;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ozs;->a:Ll/pzs;

    invoke-static {p0}, Ll/pzs;->c(Ll/pzs;)V

    return-void
.end method
