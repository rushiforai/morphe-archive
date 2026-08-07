.class public final synthetic Ll/tjf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/ujf0;

.field public final synthetic b:Z

.field public final synthetic c:Ljava/lang/Double;


# direct methods
.method public synthetic constructor <init>(Ll/ujf0;ZLjava/lang/Double;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tjf0;->a:Ll/ujf0;

    iput-boolean p2, p0, Ll/tjf0;->b:Z

    iput-object p3, p0, Ll/tjf0;->c:Ljava/lang/Double;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tjf0;->a:Ll/ujf0;

    iget-boolean v1, p0, Ll/tjf0;->b:Z

    iget-object p0, p0, Ll/tjf0;->c:Ljava/lang/Double;

    invoke-static {v0, v1, p0}, Ll/ujf0;->e1(Ll/ujf0;ZLjava/lang/Double;)V

    return-void
.end method
