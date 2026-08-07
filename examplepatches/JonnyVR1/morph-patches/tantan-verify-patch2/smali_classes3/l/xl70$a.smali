.class public Ll/xl70$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xl70;->n(Ll/xc00;Lorg/json/JSONObject;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/xc00;

.field public final synthetic b:Ll/xl70$d;


# direct methods
.method public constructor <init>(Ll/xc00;Ll/xl70$d;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xl70$a;->a:Ll/xc00;

    .line 2
    .line 3
    iput-object p2, p0, Ll/xl70$a;->b:Ll/xl70$d;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public call()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xl70$a;->a:Ll/xc00;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xl70$a;->b:Ll/xl70$d;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/xl70;->g(Ll/xc00;Ll/xl70$d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
