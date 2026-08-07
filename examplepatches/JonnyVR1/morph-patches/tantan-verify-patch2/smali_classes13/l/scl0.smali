.class public final synthetic Ll/scl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:Ll/tcl0;

.field public final synthetic b:J

.field public final synthetic c:Lkotlin/jvm/functions/Function0;

.field public final synthetic d:Lkotlin/jvm/functions/Function1;

.field public final synthetic e:Lkotlin/jvm/internal/Ref$BooleanRef;

.field public final synthetic f:J


# direct methods
.method public synthetic constructor <init>(Ll/tcl0;JLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/internal/Ref$BooleanRef;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/scl0;->a:Ll/tcl0;

    iput-wide p2, p0, Ll/scl0;->b:J

    iput-object p4, p0, Ll/scl0;->c:Lkotlin/jvm/functions/Function0;

    iput-object p5, p0, Ll/scl0;->d:Lkotlin/jvm/functions/Function1;

    iput-object p6, p0, Ll/scl0;->e:Lkotlin/jvm/internal/Ref$BooleanRef;

    iput-wide p7, p0, Ll/scl0;->f:J

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/scl0;->a:Ll/tcl0;

    iget-wide v1, p0, Ll/scl0;->b:J

    iget-object v3, p0, Ll/scl0;->c:Lkotlin/jvm/functions/Function0;

    iget-object v4, p0, Ll/scl0;->d:Lkotlin/jvm/functions/Function1;

    iget-object v5, p0, Ll/scl0;->e:Lkotlin/jvm/internal/Ref$BooleanRef;

    iget-wide v6, p0, Ll/scl0;->f:J

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static/range {v0 .. v8}, Ll/tcl0;->a(Ll/tcl0;JLkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/internal/Ref$BooleanRef;JI)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method
