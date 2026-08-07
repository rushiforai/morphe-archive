.class public final synthetic Ll/mwz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/yxz;

.field public final synthetic b:Ll/sv4;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;Ll/sv4;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/mwz;->a:Ll/yxz;

    iput-object p2, p0, Ll/mwz;->b:Ll/sv4;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mwz;->a:Ll/yxz;

    iget-object p0, p0, Ll/mwz;->b:Ll/sv4;

    check-cast p1, Ljava/lang/Integer;

    invoke-static {v0, p0, p1}, Ll/yxz;->Q2(Ll/yxz;Ll/sv4;Ljava/lang/Integer;)V

    return-void
.end method
