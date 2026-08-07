.class public final synthetic Ll/hyg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/vsg0;

.field public final synthetic c:Ll/zlg0;

.field public final synthetic d:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILl/vsg0;Ll/zlg0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/hyg0;->a:I

    iput-object p2, p0, Ll/hyg0;->b:Ll/vsg0;

    iput-object p3, p0, Ll/hyg0;->c:Ll/zlg0;

    iput-object p4, p0, Ll/hyg0;->d:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget v0, p0, Ll/hyg0;->a:I

    iget-object v1, p0, Ll/hyg0;->b:Ll/vsg0;

    iget-object v2, p0, Ll/hyg0;->c:Ll/zlg0;

    iget-object p0, p0, Ll/hyg0;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2, p0}, Ll/uyg0;->h(ILl/vsg0;Ll/zlg0;Ljava/lang/String;)V

    return-void
.end method
