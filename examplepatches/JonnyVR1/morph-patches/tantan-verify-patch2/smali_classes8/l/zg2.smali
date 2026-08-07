.class public final synthetic Ll/zg2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ah2;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ll/ah2;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/zg2;->a:Ll/ah2;

    iput-object p2, p0, Ll/zg2;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zg2;->a:Ll/ah2;

    iget-object p0, p0, Ll/zg2;->b:Ljava/lang/String;

    check-cast p1, Ll/uxj0;

    invoke-static {v0, p0, p1}, Ll/ah2;->l0(Ll/ah2;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method
