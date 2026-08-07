.class public final synthetic Ll/quo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hvo;


# direct methods
.method public synthetic constructor <init>(Ll/hvo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/quo;->a:Ll/hvo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/quo;->a:Ll/hvo;

    invoke-static {p0}, Ll/hvo;->l(Ll/hvo;)V

    return-void
.end method
