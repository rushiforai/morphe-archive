.class public final synthetic Ll/co3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/cvcenter/interfaces/DetectorListener$OnDetectorPreparedListener;


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ll/gcg0;


# direct methods
.method public synthetic constructor <init>(ILl/gcg0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Ll/co3;->a:I

    iput-object p2, p0, Ll/co3;->b:Ll/gcg0;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/Map;)V
    .locals 1

    .line 1
    iget v0, p0, Ll/co3;->a:I

    iget-object p0, p0, Ll/co3;->b:Ll/gcg0;

    invoke-static {v0, p0, p1}, Ll/do3;->l(ILl/gcg0;Ljava/util/Map;)V

    return-void
.end method
