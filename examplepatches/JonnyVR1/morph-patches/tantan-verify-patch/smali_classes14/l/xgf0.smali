.class public final synthetic Ll/xgf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/zif0;

.field public final synthetic b:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/zif0;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xgf0;->a:Ll/zif0;

    iput-object p2, p0, Ll/xgf0;->b:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xgf0;->a:Ll/zif0;

    iget-object p0, p0, Ll/xgf0;->b:Ll/x20;

    invoke-static {v0, p0}, Ll/zif0;->O(Ll/zif0;Ll/x20;)V

    return-void
.end method
