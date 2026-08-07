.class public final synthetic Ll/yhn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/din;


# direct methods
.method public synthetic constructor <init>(Ll/din;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yhn;->a:Ll/din;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yhn;->a:Ll/din;

    invoke-static {p0}, Ll/din;->C0(Ll/din;)V

    return-void
.end method
