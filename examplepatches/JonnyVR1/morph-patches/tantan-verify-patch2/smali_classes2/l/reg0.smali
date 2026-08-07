.class public final synthetic Ll/reg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zeg0;

.field public final synthetic b:Ll/i5d0;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/hrg0;


# direct methods
.method public synthetic constructor <init>(Ll/zeg0;Ll/i5d0;Ljava/lang/String;Ll/hrg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/reg0;->a:Ll/zeg0;

    iput-object p2, p0, Ll/reg0;->b:Ll/i5d0;

    iput-object p3, p0, Ll/reg0;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/reg0;->d:Ll/hrg0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/reg0;->a:Ll/zeg0;

    iget-object v1, p0, Ll/reg0;->b:Ll/i5d0;

    iget-object v2, p0, Ll/reg0;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/reg0;->d:Ll/hrg0;

    invoke-virtual {v0, v1, v2, p0}, Ll/zeg0;->i(Ll/i5d0;Ljava/lang/String;Ll/hrg0;)V

    return-void
.end method
