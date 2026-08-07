.class public final synthetic Ll/hv4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:[J

.field public final synthetic b:Lv/VText;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:[Ll/jl80;


# direct methods
.method public synthetic constructor <init>([JLv/VText;Ljava/lang/String;[Ll/jl80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/hv4;->a:[J

    iput-object p2, p0, Ll/hv4;->b:Lv/VText;

    iput-object p3, p0, Ll/hv4;->c:Ljava/lang/String;

    iput-object p4, p0, Ll/hv4;->d:[Ll/jl80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hv4;->a:[J

    iget-object v1, p0, Ll/hv4;->b:Lv/VText;

    iget-object v2, p0, Ll/hv4;->c:Ljava/lang/String;

    iget-object p0, p0, Ll/hv4;->d:[Ll/jl80;

    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreBoxData;

    invoke-static {v0, v1, v2, p0, p1}, Ll/ov4;->d([JLv/VText;Ljava/lang/String;[Ll/jl80;Lcom/p1/mobile/putong/core/data/CoreBoxData;)V

    return-void
.end method
