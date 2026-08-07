.class public final synthetic Ll/bmt;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hmt;


# direct methods
.method public synthetic constructor <init>(Ll/hmt;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bmt;->a:Ll/hmt;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmt;->a:Ll/hmt;

    invoke-static {p0}, Ll/hmt;->a(Ll/hmt;)V

    return-void
.end method
