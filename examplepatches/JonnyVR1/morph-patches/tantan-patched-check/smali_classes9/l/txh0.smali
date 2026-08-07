.class public final synthetic Ll/txh0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/uxh0;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Ll/uxh0;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/txh0;->a:Ll/uxh0;

    iput p2, p0, Ll/txh0;->b:I

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/txh0;->a:Ll/uxh0;

    iget p0, p0, Ll/txh0;->b:I

    check-cast p1, Ljava/util/Map;

    invoke-static {v0, p0, p1}, Ll/uxh0;->b(Ll/uxh0;ILjava/util/Map;)V

    return-void
.end method
